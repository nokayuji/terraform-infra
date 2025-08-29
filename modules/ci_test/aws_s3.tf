resource "aws_s3_bucket" "ci_test" {
  bucket = "${var.sys}-${var.env}-ci-bucket"
}

# resource "aws_s3_bucket_server_side_encryption_configuration" "image_delivery" {
#   bucket = aws_s3_bucket.image_delivery.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.s3_key.id
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }

resource "aws_s3_bucket_ownership_controls" "image_delivery" {
  bucket = aws_s3_bucket.ci_test.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "image_delivery" {
  bucket = aws_s3_bucket.ci_test.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
