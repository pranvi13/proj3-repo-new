resource "aws_s3_bucket" "terraform_state" {
  bucket              = var.bucket_name
  object_lock_enabled = true   # 🔐 Enable Object Lock at creation time
  tags                = var.tags
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "lock" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    default_retention {
      mode  = "GOVERNANCE"  # or "COMPLIANCE"
      days  = 1            # ⏱️ Retain each version for 2 days
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
