terraform {
  required_version = ">= 1.5"
}

# Encrypted, versioned log bucket
module "s3_logs" {
  source = "../../modules/s3_logs"
}

# Multi-region CloudTrail writing to that bucket
module "cloudtrail" {
  source          = "../../modules/cloudtrail"
  log_bucket_name = module.s3_logs.bucket_name
}

# Least-privilege IAM role (read-only)
module "iam_readonly" {
  source    = "../../modules/iam_least_privilege"
  role_name = "secure-baseline-demo-readonly"
}
