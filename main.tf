terraform {
    cloud {
    organization = "test_qwr"

    workspaces {
      name = "BTS-demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.12.0"

  bucket = "demo-bucket-${var.suffix}"

  versioning = {
    enabled = true
  }
}
