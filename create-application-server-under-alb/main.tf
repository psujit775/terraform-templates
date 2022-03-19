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

#Creating security group for AWS ALB
resource "aws_security_group" "alb" {
  name        = "terraform_alb_security_group"
  description = "Terraform load balancer security group"
  vpc_id      = var.vpcid

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

#Creating AWS ALB
resource "aws_alb" "alb" {
  name            = "${var.environment}-alb"
  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${var.public_subnet_id1}", "${var.public_subnet_id2}"]
  depends_on      = [aws_security_group.alb]
}

#Creating AWS ALB Target Group
resource "aws_alb_target_group" "group" {
  name     = "${var.environment}-target-grp"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpcid
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/"
    port = 8080
  }
}

#Creating AWS ALB Listener
resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.group.arn
    type             = "forward"
  }
  depends_on = [aws_alb.alb]
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
    from_port       = 8080
    protocol        = "tcp"
    to_port         = 8080
    security_groups = ["${aws_security_group.alb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


#Creating EC2 instance in public subnet with application server.
resource "aws_instance" "web-public" {
  ami                         = var.ami
  instance_type               = var.instance_type
  user_data                   = file("init-script.sh")
  subnet_id                   = var.public_subnet_id1
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


#Attaching EC2 instance to Target group
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_alb_target_group.group.arn
  target_id        = aws_instance.web-public.id
  port             = 8080
  depends_on       = [aws_instance.web-public]
}
