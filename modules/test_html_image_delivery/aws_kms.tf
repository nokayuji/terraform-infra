resource "aws_kms_key" "s3_key" {
  description             = "S3 bucket encryption key"
  deletion_window_in_days = 30
}