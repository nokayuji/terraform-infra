data "aws_ssm_parameter" "github_token" {
  name            = "/github/token" # 事前にパラメータストアに格納した名前
  with_decryption = true
}
