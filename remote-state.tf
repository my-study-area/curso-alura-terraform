terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "adrianoavelinolabs"

    workspaces {
      name = "aws-adrianoavelinolabs"
    }
  }
}
