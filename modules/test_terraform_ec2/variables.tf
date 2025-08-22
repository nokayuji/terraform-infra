variable "sys" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "terraform_ec2_instance_type" {
  type = string
}

variable "terraform_ec2_volume_size" {
  type = string
}

variable "public_subnet_ids" {
  type = string
}

variable "ec2_create_flag" {
  type = bool
}