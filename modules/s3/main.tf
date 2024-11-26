resource "aws_s3_bucket" "primary" {
  bucket = "${var.bucket_names[0]}-${var.primary_region}"
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  bucket = aws_s3_bucket.primary.id

  rule {
    id     = "replication-rule"
    status = "Enabled"

    destination {
      bucket = aws_s3_bucket.secondary.arn
    }
  }
}

output "bucket_arn" {
  value = aws_s3_bucket.primary.arn
}
