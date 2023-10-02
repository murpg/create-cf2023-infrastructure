variable "aws_region" {
  default = "us-east-1"
}
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ami_id" {
  type        = string
  description = "AMI ID with multi-site CommandBox cbwctl tool"
}
