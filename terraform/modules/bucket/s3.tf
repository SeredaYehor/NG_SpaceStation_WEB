resource "aws_s3_bucket" "artifacts_bucket" {
  bucket = "ng-teamcity-artifacts-bucket"

  tags = {
     Name          = "artifacts_bucket"
     Created_by    = "terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "artifacts_bucket_access" {
  bucket = aws_s3_bucket.artifacts_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
