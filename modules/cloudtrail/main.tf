provider "aws" {
  region = "us-east-1"
}

module "cloudtrail" {
  source          = "terraform-aws-modules/cloudtrail/aws"
  name            = "example-cloudtrail"
  log_bucket_name = "my-temp-bucket-for-ci"  # Replace with your actual S3 bucket if needed
  enable_logging  = true
}

output "cloudtrail_name" {
  description = "Name of the CloudTrail trail"
  value       = module.cloudtrail.cloudtrail_name
}
