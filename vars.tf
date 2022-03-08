variable "amis" {
  type = map

  default = {
    "us-east-1" = "ami-026c8acd92718196b"
    "us-east-2" = "ami-0d8f6eb4f641ef691"
  }
}

variable "cidrs_acesso_remoto" {
  type = list
  default = ["191.32.154.79/32", "192.32.154.79/32"]
}

variable "key_name" {
  default = "terraform-aws"
}
