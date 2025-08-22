module "self_hosted_runner" {
  source = "../../modules/self_hosted_runner"

  sys = var.sys
  env = var.env
  vpc_id = module.network.vpc_id
  runner_ec2_instance_type = var.runner_ec2_instance_type
  runner_ec2_volume_size = var.runner_ec2_volume_size
  public_subnet_ids = module.network.public_subnet_ids
  runner_ec2_create_flag = var.runner_ec2_create_flag
}
