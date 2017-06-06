#############################################################################
# AWS Infrastructure
#############################################################################
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
# AWS SSH Key Pair; Public key is placed on instances to enable SSH
# https://www.terraform.io/docs/providers/aws/r/key_pair.html
#
resource "aws_key_pair" "aws_ssh_key" {
  key_name   = "${var.common_name}-${terraform.env}"
  public_key = "${var.aws_public_key_material}"
}
