# module "ECS" {
#   source               = "../modules/WEB/ECS"
#   public_subnet_ids    = module.VPC.public_subnet_ids
#   public_subnet_ids_2  = module.VPC.public_subnet_ids_2
#   private_subnet_ids   = module.VPC.private_subnet_ids
#   private_subnet_ids_2 = module.VPC.private_subnet_ids_2
#   vpc_id               = module.VPC.vpc_id
#   desired_count        = var.desired_count
# }
