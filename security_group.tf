resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cidrs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh_us_east-2" {
  provider = aws.us_east-2
  name        = "acesso-ssh-us_east_2"
  description = "acesso-ssh-us_east_2"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cidrs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}
