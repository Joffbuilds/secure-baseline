module "s3_logs" {
  source = "../../modules/s3_logs"
}

module "cloudtrail" {
  source = "../../modules/cloudtrail"
  # in a real setup you'd pass the bucket name via outputs;
  # we're keeping it simple for a demo
}
