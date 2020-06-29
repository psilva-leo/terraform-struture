module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

resource "aws_iam_role" "role" {
  name = local.name
  description = local.description

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "${var.role_use_case_map[var.role_use_case]}"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  count = length(var.policies)
  role       = aws_iam_role.role.name
  policy_arn = var.policies[count.index]
}


## Adding specific policy per use case

resource "aws_iam_role_policy_attachment" "policy_lambda_attach" {
  count = var.role_use_case == "lambda" ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "policy_ec2_attach" {
  count = var.role_use_case == "ec2" ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "policy_ecs_attach" {
  count = var.role_use_case == "ecs" ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}


resource "aws_iam_instance_profile" "profile" {
  name = local.name
  role = aws_iam_role.role.name
}
