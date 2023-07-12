data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "sre-laboratory" {
  name        = "sre_laboratory"
  description = "Security Group for SRE Laboratory"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    self             = true
  }

  ingress {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sre_laboratory"
  }
}