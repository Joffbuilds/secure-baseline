package secure_baseline

# Fail if any aws_s3_bucket resource lacks AES256 or KMS encryption
deny[msg] {
  input.resource_type == "aws_s3_bucket"
  not input.values.server_side_encryption_configuration.rule[0].apply_server_side_encryption_by_default.sse_algorithm == "AES256"
  msg := sprintf("S3 bucket %s missing AES256/KMS encryption", [input.address])
}
