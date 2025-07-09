data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  
  filter {
    name   = "state"
    values = ["available"]
  }
}

# This gets your current public IP
data "http" "my_ip" {
    url = "http://api.ipify.org"
}
