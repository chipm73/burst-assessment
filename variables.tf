variable "access_key" {
  description = "AWS access key"

  #  default = ""
}

variable "secret_key" {
  description = "AWS secret access key"

  #  default = ""
}

variable "region" {
  description = "AWS region to host your network"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.10.0.0/16"
}

variable "public-az-subnet-mapping" {
  type        = "list"
  description = "CIDR for public subnet"

  default = [
    {
      name = "Burst-us-east-1a"
      az   = "us-east-1a"
      cidr = "10.10.1.0/24"
    },
    {
      name = "Burst-us-east-1b"
      az   = "us-east-1b"
      cidr = "10.10.2.0/24"
    },
  ]
}

variable "multi_az_nat_gateway" {
  description = "place a NAT gateway in each AZ"
  default     = 1
}

variable "az_count" {
  description = "number of active availability zones in VPC"
  default     = "2"
}

/* AWS Linux amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"

  default = {
    us-east-1 = "ami-4bf3d731"
    us-east-2 = "ami-4bf3d731"
  }
}
