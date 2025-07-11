terraform {
  required_version = ">= 1.5"
}

resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_s3_bucket" "logs" {
  bucket = "secure-baseline-logs-${random_id.rand.hex}"

  acl = "log-delivery-write"   # allows CloudTrail etc. to write

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning { enabled = true }

  tags = {
    Purpose = "secure-baseline-logs"
  }
}
