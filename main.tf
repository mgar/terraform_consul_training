#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-99a58be2
#
# Your security group ID is:
#
#     sg-8e08dfe6
#
# Your AMI ID is:
#
#     ami-74ee001b
#
# Your Identity is:
#
#     hashiconf-19ca14e7ea6328a42e0eb13d585e4c22
#
# Your AccessKeyID and SecretAccessKey are:
#
#     AKIAIU3HGRWM3A27HDMA
#     ufr0wEf9sLHkIqNA2/vo1b7K5jyQ3CVTL/m7jZW5
#

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
    default = "eu-central-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
    ami = "ami-74ee001b"
    instance_type = "t2.micro"

    subnet_id = "subnet-99a58be2"
    vpc_security_group_ids = ["sg-8e08dfe6"]

    tags {
        Identity = "hashiconf-19ca14e7ea6328a42e0eb13d585e4c22"
        Foo = "bar"
        Zip = "zap"
    }
}
