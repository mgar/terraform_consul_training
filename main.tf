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

    count = "3"

    tags {
        Identity = "hashiconf-19ca14e7ea6328a42e0eb13d585e4c22"
        Foo = "bar"
        Zip = "zap"
    }
}

output "public_ip" {
    # Coming soon (Terraform 0.7)
    # ["${aws_instance.web.*.public_dns}"]
    value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
    value = "${join(", ", aws_instance.web.*.public_dns)}"
}
