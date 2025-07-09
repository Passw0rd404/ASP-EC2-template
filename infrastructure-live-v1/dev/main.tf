provider "aws" {
  region = "eu-north-1"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "ec2" {
  source = "../infrastructure-modules/ec2"
  region = "eu-north-1"
  env = "dev"
  key_name = "aws-hero"
  instance_type = "t3.micro"
  user_data_script = file("build.sh")
}
