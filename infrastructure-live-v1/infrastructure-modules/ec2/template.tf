resource "aws_launch_template" "this" {
  name_prefix   = "${var.env}-ASP-template"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(var.user_data_script)

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                  = data.aws_subnets.default.ids[0]
    security_groups            = [aws_security_group.this.id]
    device_index               = 0
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.env}-ASP-server"
      Environment = var.env
      LaunchedBy  = "LaunchTemplate"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name        = "${var.env}-ASP-server-volume"
      Environment = var.env
    }
  }

  tags = {
    Name        = "${var.env}-ASP-launch-template"
    Environment = var.env
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}