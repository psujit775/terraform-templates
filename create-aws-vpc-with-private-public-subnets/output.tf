output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "ID of VPC"
}

output "public_subnet_id1" {
  value       = aws_subnet.public_subnet1.id
  description = "ID of public subnet"
}

output "public_subnet_id2" {
  value       = aws_subnet.public_subnet2.id
  description = "ID of public subnet"
}

output "private_subnet_id1" {
  value       = aws_subnet.private_subnet1.id
  description = "ID of private subnet"
}

output "private_subnet_id2" {
  value       = aws_subnet.private_subnet2.id
  description = "ID of private subnet"
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "ID of internet gateway"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of public route table"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "ID of private route table"
}

output "nat_eip" {
  value       = aws_eip.nat_eip.public_ip
  description = "Contains the public IP address"
}

output "nat_eip_id" {
  value       = aws_eip.nat_eip.id
  description = "Contains the EIP allocation ID"
}

output "security_group_id" {
  value       = aws_security_group.default.id
  description = "Conatins ID of security group"
}
