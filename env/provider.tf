terraform {
  required_version = ">= 1.5.7"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }

  backend "s3" {
    bucket  = "dev-yuji-tfstate"
    region  = "ap-northeast-1"
    key     = "develop.tfstate"
    encrypt = true
  }

}

provider "aws" {
  region = "ap-northeast-1"
}