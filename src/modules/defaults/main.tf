## Network defaults
data "aws_vpc" "default_vpc" {
  filter {
    name = "tag:Name"
    values = ["aws-landing-zone-VPC"]
  }
}

data "aws_subnet_ids" "default_vpc_public_subnets" {
  vpc_id = "${data.aws_vpc.default_vpc.id}"
  filter {
    name = "tag:Name"
    values = ["*Public*"]
  }
}

data "aws_subnet_ids" "default_vpc_private_subnets" {
  vpc_id = "${data.aws_vpc.default_vpc.id}"
  filter {
    name = "tag:Name"
    values = ["*Private*"]
  }
}

## AMI default

data "aws_ami" "amazon_linux_ecs" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
