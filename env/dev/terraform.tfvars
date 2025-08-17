vpc_id = "vpc-0550bb6cf4044c975"

az_a = "ap-northeast-1a"

az_c = "ap-northeast-1c"

az_d = "ap-northeast-1d"

cidr_block = "10.0.0.0/20"

cidr_sunet_block_public_a = "10.0.1.0/24"

cidr_sunet_block_public_c = "10.0.5.0/24"

cidr_sunet_block_private_a = "10.0.11.0/24"

cidr_sunet_block_private_c = "10.0.21.0/24"

cidr_rt_block = "0.0.0.0/0"

sys = "nyj"

env = "dev01"

# subnet_tag = {
#   public  = "terraform-infra-public-*"
#   private = "terraform-infra-private-*"
# }

# #ECS
# desired_count = 0

# #database
# engine_version               = "16.1"
# backup_retention_period      = 1
# preferred_backup_window      = "15:30-16:00"
# rds_instance_count           = 1
# instance_class               = "db.t3.medium"
# preferred_maintenance_window = "Tue:09:00-Tue:09:30"

# #EC2 GITHOST
# ami_id                  = "ami-0c1de55b79f5aff9b"
# instance_type           = "t2.micro"
# disable_api_termination = true

# ec2_instances = {
#   ap-ec2-01 = {
#     instance_type = "t3.micro"
#   }
#   ap-ec2-02 = {
#     instance_type = "t3.micro"
#   }
#   stream-ec2-01 = {
#     instance_type = "t3.micro"
#   }
#   stream-ec2-02 = {
#     instance_type = "t3.micro"
#   }
#   sso-ec2-01 = {
#     instance_type = "t3.micro"
#   }
#   sso-ec2-02 = {
#     instance_type = "t3.micro"
#   }
# }

# instance_type = {
#   ap-ec2-01     = "t3.micro"
#   ap-ec2-02     = "t3.micro"
#   stream-ec2-01 = "t3.micro"
#   stream-ec2-02 = "t3.micro"
#   sso-ec2-01    = "t3.micro"
#   sso-ec2-02    = "t3.micro"
# }
