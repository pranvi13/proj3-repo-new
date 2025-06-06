variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "security_group_ids" {
  type = list(string)
}
variable "key_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "instance_profile_name" {
  type = string
}
variable "user_data" {
  type = string
}
