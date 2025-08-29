module "ci_test" {
  source = "../../modules/ci_test"

  sys = var.sys
  env = var.env
}
