resource "aws_s3_bucket" "bucket_terraform_state" {
  bucket = "s3-${var.name}-${random_id.bucket_id.hex}"
}

resource "aws_s3_bucket_versioning" "bucket_terraform_state" {
  bucket   = aws_s3_bucket.bucket_terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_terraform_state" {
  bucket = aws_s3_bucket.bucket_terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
