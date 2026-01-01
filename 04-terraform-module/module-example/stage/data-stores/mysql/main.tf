terraform {
  backend "s3" {
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  identifier_prefix = "terraform-up-and-running-stage"
  db_name           = "stage"
  instance_class    = "db.t3.micro"
}
