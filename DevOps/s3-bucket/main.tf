module "terraform_state_bucket" {
  source      = "../../modules/s3/v0"
  bucket_name = var.bucket_name
  tags = var.tags
}