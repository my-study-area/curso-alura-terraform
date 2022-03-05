resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["191.32.154.79/32"]
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh_us_east-2" {
  provider = aws.us_east-2
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["191.32.154.79/32"]
  }
  tags = {
    Name = "ssh"
  }
}
