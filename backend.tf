# ---backend.tf ---

terraform {
  backend "s3" {
    bucket = "vpisupa"
    key    = "aws-jenkins-remote.tfstate"
    region = "us-east-1"
  }
}
