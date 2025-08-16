resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$&*()-_=[]{}<>:?"
}

resource "aws_ssm_parameter" "db_master_password" {
  name        = "/${var.name}/${var.env}/aurora/database/password/master"
  description = "DB master password."
  type        = "SecureString"
  value       = random_password.password.result
}
