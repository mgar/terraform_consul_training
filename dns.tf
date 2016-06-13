#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf
#
# Your Identity is:
#
#     hashiconf-19ca14e7ea6328a42e0eb13d585e4c22
#

provider "dnsimple" {
    email = "sethvargo+terraform@gmail.com"
    token = "1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf"
}

resource "dnsimple_record" "example" {
    domain = "terraform.rocks"
    name = "hashiconf-19ca14e7ea6328a42e0eb13d585e4c22"
    value = "${aws_instance.web.0.public_ip}"
    type = "A"
    ttl = 3600
}
