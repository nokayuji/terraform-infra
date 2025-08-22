resource "aws_s3_bucket" "image_delivery" {

}

resource "aws_s3_bucket_ownership_controls" "image_delivery" {
  bucket = aws_s3_bucket.image_delivery.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "image_delivery" {
  bucket = aws_s3_bucket.image_delivery.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "image_delivery" {
  bucket = aws_s3_bucket.image_delivery.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_object" "index_delivery" {
  bucket = aws_s3_bucket.image_delivery.id
  key    = "index.html"
  source = "${path.module}/index.html"
  acl          = "public-read"
  content_type = "text/html"
    depends_on = [ aws_s3_bucket_ownership_controls.image_delivery ]
}

resource "aws_s3_bucket_object" "image01_delivery" {
  bucket = aws_s3_bucket.image_delivery.id
  key    = "image01.jpeg"
  source = "${path.module}/image01.jpeg"
  acl          = "public-read"
  content_type = "image01/jpeg"
  depends_on = [ aws_s3_bucket_ownership_controls.image_delivery ]
}

resource "aws_s3_bucket_object" "image02_delivery" {
  bucket = aws_s3_bucket.image_delivery.id
  key    = "image02.jpeg"
  source = "${path.module}/image02.jpeg"
  acl          = "public-read"
  content_type = "image02/jpeg"
  depends_on = [ aws_s3_bucket_ownership_controls.image_delivery ]
}

resource "aws_s3_bucket_policy" "image_delivery" {
  bucket = aws_s3_bucket.image_delivery.id
  policy = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.sys}-${var.env}-image-bucket/*"
        }
    ]
})

depends_on = [ aws_s3_bucket_public_access_block.image_delivery ]
}
