#
# AWS VPC: https://www.terraform.io/docs/providers/aws/r/vpc.html
#
resource "aws_vpc" "main" {
  cidr_block = "${var.aws_vpc_cidr_block}"
  tags {
    "Name" = "${var.common_name}-${terraform.env}"
    "Terraform" = "true"
    "Environment" = "${terraform.env}"
  }
}
#
# AWS Internet Gateway
# https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
# Gives subnets access to the outside world
#
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    "Name" = "${var.common_name}-${terraform.env}"
    "Terraform" = "true"
    "Environment" = "${terraform.env}"
  }
}
#
# AWS Route
# Grant the VPC internet access on the main route table
#
resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.main.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}
#
# AWS Subnets to launch instances into
# https://www.terraform.io/docs/providers/aws/r/subnet.html
#
resource "aws_subnet" "public" {
  count = "${length(var.aws_vpc_cidr_public_subnets)}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.aws_vpc_cidr_public_subnets[count.index]}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags {
    "Name" = "${var.common_name}-${terraform.env}-${count.index}"
    "Terraform" = "true"
    "Environment" = "${terraform.env}"
  }
}
#
# AWS Load Balancing to front our instances
# https://www.terraform.io/docs/providers/aws/r/elb.html
#
resource "aws_elb" "elb" {
  name = "${var.common_name}-${terraform.env}"
  subnets = ["${aws_subnet.public.*.id}"]
  security_groups = ["${module.elb_http_security_group.id}"]
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }
  tags {
    "Terraform" = "true"
    "Environment" = "${terraform.env}"
  }
}
#
# AWS Firewalls
# https://www.terraform.io/docs/providers/aws/r/security_group.html
#
module "elb_http_security_group" {
  source      = "github.com/ckelner/tf_aws_http_sg"
  vpc_id      = "${aws_vpc.main.id}"
  name_prefix = "${var.common_name}-${terraform.env}"
  description = "For allowing HTTP Traffic to the ELB"
  tags        = {
    "Terraform" = "true"
    "Environment" = "${terraform.env}"
  }
}
