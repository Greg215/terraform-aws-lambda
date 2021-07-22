terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    bucket = "<your bucket name for the backend>"
    key    = "greg-lambda/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = var.region
}