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

runner_ec2_instance_type = "t3.medium"
runner_ec2_volume_size = 16

runner_ec2_create_flag = true