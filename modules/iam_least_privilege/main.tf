terraform {
  required_version = ">= 1.5"
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "secure-baseline-readonly"
}

# Inline policy allowing read-only access to common services
data "aws_iam_policy_document" "readonly" {
  statement {
    actions = [
      "s3:Get*",
      "s3:List*",
      "ec2:Describe*",
      "cloudtrail:Get*",
      "cloudtrail:LookupEvents"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "readonly" {
  name               = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
  inline_policy {
    name   = "readonly-policy"
    policy = data.aws_iam_policy_document.readonly.json
  }

  tags = { Purpose = "secure-baseline-least-privilege" }
}
