terraform {
  backend "s3" {
    encrypt        = true
    profile        = "hyeonju-test"
    key            = "test-2024/infra/terraform.tfstate"
    region         = "ap-northeast-2"

    bucket         = "hyeonju-tfstate-2024"
    dynamodb_table = "dynamodb-hyeonju-terraform"
  }
}


# resource "aws_s3_bucket" "bucket_terraform_state" {
#   bucket = "hyeonju-tfstate-2024"
# }

# resource "aws_s3_bucket_versioning" "bucket_terraform_state" {
#   bucket   = aws_s3_bucket.bucket_terraform_state.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "bucket_terraform_state" {
#   bucket = aws_s3_bucket.bucket_terraform_state.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

resource "aws_dynamodb_table" "table_terraform_locks" {
  name           = "dynamodb-hyeonju-terraform"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

