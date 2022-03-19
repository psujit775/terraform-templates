variable "region" {
  default = "ap-south-1"
}

variable "environment" {
  default     = "demo"
  description = "Deployment Environment"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block of the vpc"
}

variable "public_subnet_cidr1" {
  default     = "10.0.0.0/24"
  description = "CIDR block of the public subnet"
}

variable "public_subnet_cidr2" {
  default     = "10.0.1.0/24"
  description = "CIDR block of the public subnet"
}

variable "private_subnet_cidr1" {
  default     = "10.0.2.0/24"
  description = "CIDR block of the private subnet"
}

variable "private_subnet_cidr2" {
  default     = "10.0.3.0/24"
  description = "CIDR block of the private subnet"
}

variable "availability_zone1" {
  default     = "ap-south-1a"
  description = "availability zones"
}

variable "availability_zone2" {
  default     = "ap-south-1b"
  description = "availability zones"
}

