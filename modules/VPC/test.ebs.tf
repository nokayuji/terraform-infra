resource "aws_ebs_volume" "test" {
  availability_zone = "ap-northeast-1a"
  size              = var.size
  encrypted         = false # ❌ TFLintに怒られる
}
