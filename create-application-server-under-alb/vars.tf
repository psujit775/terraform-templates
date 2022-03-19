variable "region" {
  default = "ap-south-1"
}

variable "environment" {
  default     = "demo"
  description = "Deployment Environment"
}

variable "ami" {
  default     = "ami-0851b76e8b1bce90b"
  description = "ubuntu 20.04 LTS image"
}

variable "instance_type" {
  default     = "t3a.micro"
  description = "instance type of ec2."
}

variable "vpcid" {
  default     = "vpc-0d55a85e2f47d36ce"
  description = "VPC id of an existing vpc"
}

variable "public_subnet_id1" {
  default     = "subnet-0d1a3f4ea20d14543"
  description = "Existing public subnet id"
}

variable "public_subnet_id2" {
  default     = "subnet-03444ce7c9647be33"
  description = "Existing public subnet id"
}

variable "enable_public_ip" {
  default     = "true"
  description = "Enable/Disable public ip."
}

variable "keyname" {
  default     = "demo"
  description = "key pair name"
}
