# module "AURORA" {
#   source                       = "../modules/WEB/AURORA"
#   vpc_id                       = module.VPC.vpc_id
#   name                         = var.name
#   env                          = var.env
#   engine_version               = var.engine_version
#   availability_zones           = module.VPC.subnet_availability_zones
#   backup_retention_period      = var.backup_retention_period
#   preferred_backup_window      = var.preferred_backup_window
#   rds_instance_count           = var.rds_instance_count
#   instance_class               = var.instance_class
#   preferred_maintenance_window = var.preferred_maintenance_window
#   subnet_ids                   = module.VPC.subnet_ids
#   ecs_sg_web                   = module.ECS.ecs_sg_web
# }
