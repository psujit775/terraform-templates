variable "region" {
  default = "ap-south-1"
}

variable "environment" {
  default     = "demo"
  description = "Deployment Environment"
}

variable "ami" {
  default = "ami-0851b76e8b1bce90b"
  description = "ubuntu 20.04 LTS image"
}

variable "instance_type" {
  default = "t3a.micro"
  description = "instance type of ec2."
}

variable "vpcid" {
  default = "Replcae with your VPC ID"
  description = "VPC id of an existing vpc" 
}

variable "private_subnet_id" {
  default = "Replcae with your private subnet ID"
  description = "Existing private subnet id"
}

variable "enable_public_ip" {
  default = "false"
  description = "Enable/Disable public ip."
}

variable "keyname" { 
  default = "Replace with your key pair name"
  description = "key pair name" 
}
