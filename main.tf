terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
  }

}

provider "aws" {
  region = "us-east-1"
}

locals {
  vpc = {
    name = "jesus-networking"
    cidr = "192.168.0.0/20"
    azs  = ["us-east-1a"]
    subnets = {
      private = ["192.168.0.0/23", "192.168.2.0/25", "192.168.2.128/26"]
      public  = ["192.168.2.192/26"]
    }
  }
}