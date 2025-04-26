terraform {
  backend "s3" {
    bucket  = "fqts-bucket-tfstate"   # must be globally unique
    key     = "env/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}