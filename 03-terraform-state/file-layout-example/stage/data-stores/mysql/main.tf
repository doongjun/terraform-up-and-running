terraform {
  backend "s3" {
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  db_name             = "example_database"
  username            = "admin"
  password            = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["password"]
  skip_final_snapshot = true
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "mysql-master-password"
}
