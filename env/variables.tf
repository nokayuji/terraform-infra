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

# variable "engine_version" {
#   type = string
#   #16.1

# }

# variable "backup_retention_period" {
#   type = number
#   #1
# }

# variable "preferred_backup_window" {
#   type = string
#   #"15:30-16:00"
# }

# variable "rds_instance_count" {
#   type = number
#   #1
# }

# variable "instance_class" {
#   type = string
#   #"db.t3.medium"
# }

# variable "preferred_maintenance_window" {
#   type = string
#   #"Tue:18:30-Tue:19:00"
# }

# variable "subnet_tag" {
#   type = object({
#     public  = string
#     private = string
#   })
# }

variable "vpc_id" {
  type = string
}

# variable "desired_count" {
#   type = number
# }

# variable "ami_id" {
#   type = string
# }

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
