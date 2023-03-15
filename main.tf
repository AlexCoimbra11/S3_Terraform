terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "us-east-1" # Norte da virginia  
}
resource "aws_s3_bucket" "b" {
  bucket = "ArquivosBackup"
  
  tags = {
    Name = "My bucket"
    Environment = "Dev"
  }
  
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#private-bucket-w-tags
resource "aws_s3_bucket_acl" "example" {
  bucket = "aws_s3_bucket.b.id"
  acl    = "private"
  
}

# terraform init
# terraform apply --auto-approve
# terraform destroy --auto-approve