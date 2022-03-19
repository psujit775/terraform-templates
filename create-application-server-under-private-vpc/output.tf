output "ec2instance_ip" {
  value = aws_instance.web.private_ip
}

output "ec2instance_id" {
  value = aws_instance.web.id
}

