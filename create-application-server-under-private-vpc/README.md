# Terraform Template
![Image](https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg)
## Terraform template to create application server under Private VPC on EC2 Instance.

List of Resoureces will be created with this template.
1. Security Group
2. EC2 instacnce
3. Network Interface
4. Volume

---
*Note*: I'm deploying tomcat server on EC2 Insatnce for demo purpose. This server will not be accessible in public network. Tomcat server running on http://localhost:8080
---

## Prerequisites
- VPC
- Private Subnet
- NAT Gateway
- key (for ssh)

## Update vars.tf
* Do not foreget to update vars.tf with your vpcid, private_subnet_id and keyname.

## Steps
- Clone the repository.
- run ```terraform init``` to initialize the dir.
- run ```terraform plan``` to check resources before creating.
- run ```terraform apply``` to create resources in your AWS account.

---
*Note*: I'm using ec2 instance user_data feature to setup tomcat application.
---

## About ```user_data```
user_data allow us to run shell commands or scripts to make sure they are ready to launch your application.

## Troubleshooting ```user_data``` related issues
* User data shell scripts must start with the Shebang #! (for example #!/bin/bash).
* Scripts entered as user data are run as the root user, so no need to use sudo.
* Copy of your script can be found at `/var/lib/cloud/instances/<instance-id>/user-data.txt`.
* The cloud-init output log file can be found at `/var/log/cloud-init-output.log`.


