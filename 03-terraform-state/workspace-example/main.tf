terraform {
  backend "s3" {
    key = "workspace-example/terraform.tfstate"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0b818a04bc9c2133c"
  instance_type = "t2.micro"
}
