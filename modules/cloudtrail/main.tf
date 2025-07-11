terraform {
  required_version = ">= 1.5"
}

resource "aws_cloudtrail" "secure" {
  name                       = "secure-baseline-trail"
  s3_bucket_name = var.log_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  kms_key_id                    = null          # uses S3 SSE-AES256

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }

  tags = {
    Purpose = "secure-baseline-cloudtrail"
  }
}
