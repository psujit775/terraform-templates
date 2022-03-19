# Terraform Template
![Image](https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg)
## Terraform template to create application server under AWS Application Load balancer.

List of Resoureces will be created with this template.
1. Security Group for Application Load balancer
2. Application Load balancer
3. Application Load balancer Target_Group
4.  Application Load balancer Listener (Port 80)
5. Security Group for Application EC2 instance (Port 22 open for public and Port 8080 open only for Application Load balancer security group )
6. EC2 Instance with tomcat server
7. Add EC2 instance to Target Group
---
*Note*: I'm deploying tomcat server on EC2 Insatnce for demo purpose. This server can be accessed through Application Load balancer DNS Name on port 80. Tomcat server running on http://localhost:8080
---

## Prerequisites
- VPC
- Two subnets in two different Availability Zones
- keypair (for ssh)

## Update vars.tf
* Do not foreget to update vars.tf with your vpcid, public_subnet_id1,public_subnet_id2 and keyname.

## Steps
- Clone the repository.
- run ```terraform init``` to initialize the dir.
- run ```terraform plan``` to check resources before creating.
- run ```terraform apply``` to create resources in your AWS account.

##Output
run `terraform output` to check ALB DNS, ec2 instance public ip and other deatils.

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
