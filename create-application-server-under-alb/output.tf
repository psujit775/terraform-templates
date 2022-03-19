output "albsecgrp" {
  value       = aws_security_group.alb.id
  description = "ID of AWS ALB security group"
}

output "alb_public_hostname" {
  value       = aws_alb.alb.dns_name
  description = "AWS ALB public DNS"
}

output "ec2secgrp" {
  value       = aws_security_group.demo-sg.id
  description = "ID of EC2 security group"
}

output "ec2instance_ip" {
  value       = aws_instance.web-public.public_ip
  description = "public ip of EC2 instance"
}

output "ec2instance_id" {
  value       = aws_instance.web-public.id
  description = "ID ip of EC2 instance"
}

