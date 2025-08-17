module "S3" {
  source = "../../modules/S3"

  sys = var.sys
  env = var.env
}
