module "s3_logs" {
  source = "../../modules/s3_logs"
}

module "cloudtrail" {
  source = "../../modules/cloudtrail"
  # in a real setup you'd pass the bucket name via outputs;
  # we're keeping it simple for a demo
}
# --- Least-privilege IAM role --------------------------
module "iam_readonly" {
  source = "../../modules/iam_least_privilege"
  role_name = "secure-baseline-demo-readonly"
}
module "cloudtrail" {
  source          = "../../modules/cloudtrail"
log_bucket_name = "my-temp-bucket-for-testing"

}
