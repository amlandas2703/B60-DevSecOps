provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "dasa-b60-state-file"
    key    = "tools/tools-env/terraform.tfstate"
    region = "us-east-1"
    
  }
}