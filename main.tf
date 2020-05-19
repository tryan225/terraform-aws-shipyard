provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "lab_server" {
  ami                         = "ami-0122f91fd9e5c346a"
  instance_type               = "t2.medium"
  key_name                    = "tyler-us-east-1"
  vpc_security_group_ids      = [aws_security_group.allow_http_docs_site.id]
  associate_public_ip_address = true
  tags                        = {
    Name = "support-lab-test"
  } 
  user_data                   = <<EOF
    #! /bin/bash
    sudo curl https://shipyard.run/install | bash
    shipyard run github.com/shipyard-run/blueprints//consul-docker
  EOF
}

resource "aws_security_group" "allow_http_docs_site" {
  name        = "allow_http_docs_site"
  description = "Allow http over 18080"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP from WAN"
    from_port   = 18080
    to_port     = 18080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from WAN"
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

