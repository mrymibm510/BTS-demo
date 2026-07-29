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

data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t2.micro"

  tags = {
    Name = "My-Terraform-EC2"
  }
}
