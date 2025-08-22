module "test_terraform_ec2" {
  source = "../../modules/teat_terraform_ec2"

  sys = var.sys
  env = var.env
  vpc_id = module.network.vpc_id
  terraform_ec2_instance_type = var.terraform_ec2_instance_type
  terraform_ec2_volume_size = var.terraform_ec2_volume_size
}
