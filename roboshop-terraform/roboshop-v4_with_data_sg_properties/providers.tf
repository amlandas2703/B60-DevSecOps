provider "aws" {
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket = "dasa-b60-state-file"
    key    = "expense-v4/terraform.tfstate"
    
  }
  
}