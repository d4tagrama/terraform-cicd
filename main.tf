terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud { 
    
    organization = "D4tagram" 

    workspaces { 
      name = "Prod" 
    } 
  }
}

# Configure the AWS Provider
provider "aws" {
  region = local.region
}

