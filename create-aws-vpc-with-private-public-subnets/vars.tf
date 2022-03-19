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

variable "public_subnet_cidr" {
  default     = "10.0.0.0/24"
  description = "CIDR block of the public subnet"
}

variable "private_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "CIDR block of the private subnet"
}

variable "availability_zones" {
  default     = "ap-south-1a"
  description = "availability zones"
}
