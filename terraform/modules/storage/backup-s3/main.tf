resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "mongodb_backup" {

  bucket = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"

  tags = {
    Name = "mongodb-backup"
  }
}

resource "aws_s3_bucket_versioning" "backup_versioning" {

  bucket = aws_s3_bucket.mongodb_backup.id

  versioning_configuration {
    status = "Enabled"
  }
}
