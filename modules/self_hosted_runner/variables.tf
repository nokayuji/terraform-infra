variable "sys" {
  type        = string
  description = "System name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "vpc_id" {
  type        = string
  description = "My VPC id"
}

variable "runner_ec2_instance_type" {
  type        = string
  description = "Instance type for terraform EC2"
}

variable "runner_ec2_volume_size" {
  type        = string
  description = "EBS volume size"
}

variable "runner_ec2_create_flag" {
  type        = bool
  description = "Whether to create an EC2 instance"
}

variable "public_subnet_ids" {
  type        = string
  description = "subnet ID"
}

variable "my_cidr" {
  type        = string
  description = "my IP"
}

