# Secure Baseline
![Terraform Validate](https://github.com/joffbuilds/secure-baseline/actions/workflows/terraform-validate.yml/badge.svg)

Terraform starter kit for a secure AWS baseline

## What’s inside
* **modules/s3_logs** – encrypted, versioned S3 bucket for centralized logs  
* **modules/cloudtrail** – multi-region CloudTrail that writes to that bucket  
* **examples/single-account** – demo wiring both modules together  

## Quick Start
```bash
# 1) Clone
git clone https://github.com/joffbuilds/secure-baseline.git
cd secure-baseline/examples/single-account

# 2) Init Terraform
terraform init

# 3) Review & apply
terraform plan
terraform apply
````

> **Note**: You'll need AWS creds in your shell with permission to create
> S3 buckets and CloudTrail resources.

## Roadmap

* [ ] Add IAM least-privilege module
* [ ] OPA policy tests in GitHub Actions
* [ ] README architecture diagram
