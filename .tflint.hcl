plugin "terraform" {
    enabled = true
    version = "0.2.0"
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}

plugin "aws" {
    enabled = true
    version = "0.42.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
