terraform {
  backend "s3" {
    bucket  = "nokayuji-terraform-tfstate-bucket"
    region  = "ap-northeast-1"
    key     = "terraform.tfvars"
    encrypt = true
  }
}
