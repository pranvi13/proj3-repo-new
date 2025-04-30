terraform {
  backend "s3" {
    bucket = "fqts-proj3-s3-bucket"           # Your S3 bucket name
    key    = "path/to/your/terraform.tfstate"  # Path to store the state file inside the bucket
    region = "us-east-1"                       # Region where the S3 bucket is located
    encrypt = true                             # Enable server-side encryption
    acl     = "bucket-owner-full-control"      # ACL for the state file (optional)
    
  }
}
