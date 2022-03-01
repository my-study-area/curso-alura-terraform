provider "aws" {
  region                      = "us-east-1"
  access_key                  = "teste"
  secret_key                  = "teste"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  profile                     = "localstack"
  endpoints {
    ec2 = "http://localhost:4566"
  }
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
}
