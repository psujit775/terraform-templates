# Terraform Template
![Image](https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg)
## Terraform template to create AWS vpc with one private and public subnet along with Internet Gateway and NAT Gateway.

List of Resoureces will be created with this template.
1. AWS VPC with CIDR 10.0.0.0/16
2. subnets (public and private)
3. Internet Gateway
4. Route Table (for public and private)
5. Elastic IP for NAT gateway 
6. NAT Gateway
7. Associate route tables
8. Default security group for VPC

---
*Note*: update vars.tf file to change env name and CIDR range.
---

## Prerequisites
- AWS ACCOUNT
- AWS Access keys
- AWS CLI 
- Terrafrom CLI

## Steps
- Clone the repository.
- run ```terraform init``` to initialize the dir.
- run ```terraform plan``` to check resources before creating.
- run ```terraform apply``` to create resources in your AWS account.
