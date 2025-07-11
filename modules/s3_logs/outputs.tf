output "bucket_name" {
  description = "Name of the encrypted S3 log bucket"
  value       = aws_s3_bucket.logs.id
}
