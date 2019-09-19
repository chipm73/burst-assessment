# Burst Demo

This is the terraform script used for the Burst Assessment.

In this terraform script, we breakdown the environment into multiple components, including VPC, private subnet, public subnet, security groups and variables.

Burst DevOps Test Problem 1 (Burst confidential)

Please write some Terraform to stand up resources in AWS that meets the following
criteria.
Please use any features in the standard build of Terraform to complete the
work. Send us the code in a zip file or link to a public git repository. If there are any
modifications to the code we need to make so it runs correctly, please include
instructions. Feel free to reach out if you get stuck or want clarifications. All The Best!
Running terraform apply should create the following resources:
● A VPC with at least 2 subnets in separate availability zones
● An instance whose "Name" in the AWS console shows up as "Server1". Server1 should
use a public Centos AMI.
● An instance whose "Name" in the AWS console shows up as "Server2". Server2 should
use a public Centos AMI.
● Each instance should be in its own subnet.
● At the end of the apply, Terraform should print out the IPs of the instances and any
information needed to log into server1 or server2.
After the resources are created:
● The person who ran Terraform apply should be able to ssh into Server1 and Server2
● AWS should be configured to allow Server1 and Server2 to be able to communicate over
tcp/22.
● AWS should be configured to allow Server1 and Server2 to be able to communicate with
each other via tcp/80 and tcp/443. We do not expect you to configure services to run on
tcp/80 and tcp/443 on each server, but AWS should be configured to allow that traffic.
● Running Terraform destroy should remove all the resources created.
Bonus Points:
● Write terraform code to install and configure something that listens on tcp/80 and tcp/443
● Utilize the Data Source feature of Terraform
● Utilize the module feature of Terraform
● Write a paragraph on what you liked or didn't like about Terraform
● Configure a service on one of the instances using Chef
