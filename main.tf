provider "aws" {
    region = var.region
    access_key = "abc"
    secret_key = "def/V/ghi"
  
}
resource "aws_security_group" "sg-grp" {
    name = var.sgname
    vpc_id = var.vpcid


ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
}
lifecycle {
  create_before_destroy = true
}
}

resource "aws_security_group" "sg-terrform" {
    name = var.sg2name
    vpc_id = var.vpcid


ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
}
lifecycle {
  create_before_destroy = true
}
}

resource "aws_instance" "ec2" {
    ami = var.imageid
    instance_type = var.itype
    key_name = var.keypair
    associate_public_ip_address = true

      vpc_security_group_ids = [
      aws_security_group.sg-terrform.id  
      ]

    tags = {
        Name = "terraformawsoct"
        environment = "Dev"
    }
  
}
