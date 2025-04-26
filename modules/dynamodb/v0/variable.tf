variable "table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  type        = string
}

variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
  default     = "LockID"
}

variable "tags" {
  description = "Tags for the DynamoDB table"
  type        = map(string)
  default     = {}
}
