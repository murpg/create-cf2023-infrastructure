resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "demo-cf2023"
  }
}

resource "aws_security_group" "sg" {
  name = "demo-cf2023"

  tags = {
    Name = "demo-cf2023"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["74.95.90.101/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "key" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "key" {
  key_name   = "demo-cf2023"
  public_key = trimspace(tls_private_key.key.public_key_openssh)
}

