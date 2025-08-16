variable "sys" {
  type = string
}

variable "env" {
  type = string
}

# variable "ec2_instances" {
#   description = "EC2を複製し、可変変数はtfvarsでそれぞれ変更管理する"
#   type = map(object({
#     instance_type = string
#     subnet_id     = string
#   }))
# }

variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type = map(string)
}

variable "subnet_id_1a" {
  type = string
}

variable "subnet_id_1c" {
  type = string
}
