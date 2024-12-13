terraform {
  backend "s3" {
    bucket = "terraform-d4tagrama"
    key    = "data/terraform.tfstate"
    dynamodb_table = "terraform-lock-file"
    region = "us-east-1"
  }
}
