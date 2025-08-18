module "GITHOST" {
  source                  = "../../modules/GITHOST"
  subnet_id               = module.VPC.subnet_ids[0] #リストの1番目から順にidの割り当て
  availability_zone       = module.VPC.subnet_availability_zones[0]
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  disable_api_termination = var.disable_api_termination
  env                     = var.env
  vpc_id                  = module.VPC.vpc_id

}
