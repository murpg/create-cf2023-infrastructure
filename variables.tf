variable "aws_region" {
  default = "us-east-1"
}
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ami_id" {
  type        = string
  description = "AMI ID with multi-site CommandBox cbwctl tool"
}

variable "hostname" {
  description = "The Terraform Cloud hostname"
  type        = string
}

variable "organization" {
  description = "The Terraform Cloud organization name"
  type        = string
}

variable "workspace_name" {
  description = "The Terraform Cloud workspace name"
  type        = string
}
