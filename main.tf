provider "aws" {
  region = "${var.region}"
  version = "~> 2.48"

}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Metsian"


    workspaces {
      name = "ModulesTest"
    }
  }
}

module "app" {

  source  = "ec2-54-234-137-178.compute-1.amazonaws.com/Slalom/ec2/aws"
  version = "1.0.0"

  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  }

  module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "saraths-terraform-test-bucket"
  acl    = "private"

  versioning = {
    enabled = true
  }

}