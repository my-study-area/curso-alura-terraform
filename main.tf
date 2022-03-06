provider "aws" {
  region                      = "us-east-1"
  access_key                  = "teste"
  secret_key                  = "teste"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  profile                     = "localstack"
  s3_use_path_style           = true
  endpoints {
    ec2 = "http://localhost:4566"
    s3 = "http://localhost:4566"
  }
}

provider "aws" {
  alias = "us_east-2"
  region                      = "us-east-2"
  access_key                  = "teste"
  secret_key                  = "teste"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  profile                     = "localstack"
  s3_use_path_style           = true
  endpoints {
    ec2 = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
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
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami           = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  depends_on = [aws_s3_bucket.dev4]
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev5" {
  ami           = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider = aws.us_east-2
  ami           = "ami-0d8f6eb4f641ef691"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh_us_east-2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us_east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  # read_capacity  = 20
  # write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "adrianoavelino-dev4"

  tags = {
    Name        = "adrianoavelino-dev4"
  }
}


