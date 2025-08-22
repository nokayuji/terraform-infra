variable "az_a" {
  type = string
}

variable "az_c" {
  type = string
}

variable "az_d" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "cidr_sunet_block_public_a" {
  type = string
}

variable "cidr_sunet_block_public_c" {
  type = string
}

variable "cidr_sunet_block_private_a" {
  type = string
}

variable "cidr_sunet_block_private_c" {
  type = string
}

variable "cidr_rt_block" {
  type = string
}

variable "sys" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

# variable "instance_type" {
#   type = string
# }

# #variable "associate_public_ip_address" {
# #  type = string
# #}

# variable "disable_api_termination" {
#   type = bool
# }

# variable "vpc_id" {
#   type = string
# }

# variable "instance_type" {
#   type = map(string)
# }

# variable "subnet_id" {
#   type = map(string)
# }

# variable "sg_group" {
#   type = map(list)
# }

# variable "ec2_instances" {
#   type = map(object({
#     instance_type = string
#   }))
# }

# variable "instance_type" {
#   type = map(string)
# }

variable "terraform_ec2_instance_type" {
  type        = string
  description = "Instance type for terraform EC2"
}

variable "terraform_ec2_volume_size" {
  type        = string
  description = "EBS volume size"
}

variable "ec2_create_flag" {
  type        = bool
  description = "Whether to create an EC2 instance"
}

variable "runner_ec2_instance_type" {
  type        = string
  description = "Instance type for runner EC2"
}

variable "runner_ec2_volume_size" {
  type        = string
  description = "EBS volume size"
}

variable "runner_ec2_create_flag" {
  type        = bool
  description = "Whether to create an EC2 instance"
}