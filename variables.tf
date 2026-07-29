variable "aws_region" {
  default = "us-west-2"
}

variable "suffix" {
  type    = string
  default = "mshahid-072826-a13"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}