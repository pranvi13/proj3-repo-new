terraform {
  backend "s3" {
    bucket         = "fqts-bucket-tfstate-proj3"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "fqts-tfstate-lock-proj3"   # <--- newly added
  }
}
