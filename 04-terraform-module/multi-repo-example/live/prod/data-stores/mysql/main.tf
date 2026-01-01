terraform {
  backend "s3" {
    key = "prod/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "mysql" {
  source = "git::https://github.com/doongjun/terraform-up-and-running.git//04-terraform-module/module-example/modules/data-stores/mysql?ref=v0.0.1"

  identifier_prefix = "terraform-up-and-running-prod"
  db_name           = "prod"
  instance_class    = "db.t3.micro"
}
