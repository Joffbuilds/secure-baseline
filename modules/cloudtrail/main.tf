resource "aws_cloudtrail" "this" {
  name                          = "secure-baseline-cloudtrail"
  s3_bucket_name                = var.log_bucket_name
  is_multi_region_trail         = true
  include_global_service_events = true
  enable_logging                = true
}

output "cloudtrail_name" {
  description = "Name of the CloudTrail trail"
  value       = aws_cloudtrail.this.name
}
