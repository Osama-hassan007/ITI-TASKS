terraform {
  backend "s3" {
    bucket = "iti-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
