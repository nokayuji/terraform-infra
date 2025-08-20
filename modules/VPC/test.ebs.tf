resource "aws_ebs_volume" "test" {
  availability_zone = "ap-northeast-1a"
  size              = 10
  encrypted         = false # ❌ TFLintに怒られる
}
