resource "aws_ebs_volume" "test" {
  availability_zone = "ap-northeast-1a"
  size              = var.size
  encrypted         = var.enc # ❌ TFLintに怒られる
  volume_type       = "invalid_type"
}
