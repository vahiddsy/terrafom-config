terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.region     # Change to your desired region % export AWS_REGION="us-west-2"
  access_key = var.access_key # % export AWS_ACCESS_KEY_ID="anaccesskey"
  secret_key = var.secret_key # % export AWS_SECRET_ACCESS_KEY="asecretkey"
}