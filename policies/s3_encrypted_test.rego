package secure_baseline

# Mock input: an unencrypted S3 bucket
test_unencrypted_bucket_denied {
  deny[_] with input as {
    "resource_type": "aws_s3_bucket",
    "address": "aws_s3_bucket.bad",
    "values": {}
  }
}

# Mock input: an encrypted S3 bucket
test_encrypted_bucket_allowed {
  not deny[_] with input as {
    "resource_type": "aws_s3_bucket",
    "address": "aws_s3_bucket.good",
    "values": {
      "server_side_encryption_configuration": {
        "rule": [{
          "apply_server_side_encryption_by_default": {
            "sse_algorithm": "AES256"
          }
        }]
      }
    }
  }
}
