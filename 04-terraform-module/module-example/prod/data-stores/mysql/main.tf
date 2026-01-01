terraform {
  backend "s3" {
    key = "prod/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  identifier_prefix = "terraform-up-and-running-prod"
  db_name           = "prod"
  instance_class    = "db.t3.micro"
}
