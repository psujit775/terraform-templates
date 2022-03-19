terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  region = var.region
}


#Creating security group
resource "aws_security_group" "demo-sg" {
  name        = "${var.environment}-ec2-sg"
  description = "security group for ${var.environment}-ec2-instance"
  vpc_id      = var.vpcid

  #To Allow SSH
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  #to allow tomcat
  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


#Creating EC2 instance in private subnet with application server.
resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance_type
  user_data                   = file("init-script.sh")
  subnet_id                   = var.private_subnet_id
  associate_public_ip_address = var.enable_public_ip
  key_name                    = var.keyname

  vpc_security_group_ids = [
    aws_security_group.demo-sg.id
  ]

  depends_on = [aws_security_group.demo-sg]

  tags = {
    Name        = "${var.environment}-instance"
    Environment = var.environment
  }
}

