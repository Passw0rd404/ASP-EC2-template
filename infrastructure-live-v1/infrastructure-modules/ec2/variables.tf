variable "region" {
    description = "AWS region"
    type = string
    default = "eu-north-1"
}

variable "env" {
    description = "enviroment name"
    type = string
    default = "prod"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t3.micro"
}

variable "key_name" {
    description = "EC2 Key Pair name"
    type = string
    default = "aws-hero"
}
