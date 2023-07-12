terraform {
  backend "s3" {
    bucket = "antonioazambuja-tfstates"
    key    = "sre-laboratory/terraform.tfstate"
    region = "us-east-1"
  }
}