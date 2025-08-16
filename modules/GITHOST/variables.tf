variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

#variable "associate_public_ip_address" {
#  type = string
#}

variable "disable_api_termination" {
  type = bool
}

variable "env" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "availability_zone" {
  type = string
}
