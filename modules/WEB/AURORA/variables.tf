variable "vpc_id" {
  type = string
}

variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "engine_version" {
  type = string
  #16.1

}

variable "availability_zones" {

  type = list(string)

}

variable "backup_retention_period" {
  type = number
  #1
}

variable "preferred_backup_window" {
  type = string
  #"15:30-16:00"
}

variable "rds_instance_count" {
  type = number
  #1
}

variable "instance_class" {
  type = string
  #"db.t3.medium"
}

variable "preferred_maintenance_window" {
  type = string
  #"Tue:18:30-Tue:19:00"
}

variable "subnet_ids" {
  type = list(string)
}

variable "ecs_sg_web" {
  type = string
}
