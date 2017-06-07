#
# Get the instances on the load balancer
# https://www.terraform.io/docs/providers/aws/d/instance.html
#
data "aws_instance" "web_elb" {
  count       = "${var.aws_asg_desired}"
  instance_id = "${aws_elb.elb.instances[count.index]}"
}
