data "aws_ami" "amazon-linux-2" {
    most_recent = true

    filter {
        name   = "owner-alias"
        values = ["amazon"]
    }

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm*"]
    }
}

resource "aws_launch_template" "sre-laboratory" {
    name_prefix   = "sre-laboratory"
    image_id      = data.aws_ami.amazon-linux-2.id
    instance_type = "t2.micro"
    key_name      = "sre-laboratory"
    vpc_security_group_ids = [ aws_security_group.sre-laboratory.id ]
    iam_instance_profile {
      name = aws_iam_instance_profile.sre-laboratory.name
    }
    tag_specifications {
      resource_type = "instance"
      tags = {
        consul-dc = "antonioazambuja"
      }
    }
}

resource "aws_autoscaling_group" "sre-laboratory" {
    availability_zones = ["us-east-1a"]
    desired_capacity   = 3
    max_size           = 3
    min_size           = 3

    launch_template {
        id      = aws_launch_template.sre-laboratory.id
        version = "$Latest"
    }
}

resource "aws_iam_instance_profile" "sre-laboratory" {
  name = "sre-laboratory"
  role = aws_iam_role.sre-laboratory.name
}

resource "aws_iam_role_policy" "sre-laboratory" {
  name = "sre-laboratory"
  role = aws_iam_role.sre-laboratory.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "sre-laboratory" {
  name = "sre-laboratory"
  path = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}