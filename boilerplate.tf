#
# Require version of terraform
# https://www.terraform.io/docs/configuration/terraform.html
#
terraform {
  required_version = ">= 0.9.5"
}
#
# AWS Provider: https://www.terraform.io/docs/providers/aws/index.html
#
provider "aws" {
  region = "${var.aws_region}"
}
#
# Get the availability zones for our given region
# https://www.terraform.io/docs/providers/aws/d/availability_zones.html
#
data "aws_availability_zones" "available" {}
