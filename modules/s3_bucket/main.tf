resource "aws_s3_bucket" "main" {
  bucket = "my-s3-bucket"
  acl    = "private"
  # Add other S3 bucket configurations as needed
}
