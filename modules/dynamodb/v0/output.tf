output "table_name" {
  description = "The name of the created DynamoDB table"
  value       = aws_dynamodb_table.terraform_lock.name
}
