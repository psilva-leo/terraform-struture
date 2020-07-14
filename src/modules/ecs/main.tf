module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}


resource "aws_ecs_task_definition" "task" {
  family                = local.name
  container_definitions = <<TASK_DEFINITION
  [
    {
      "name": "${local.name}",
      "image": "${local.image}",
      "memoryReservation": 128,
      "cpu": 10,
      "environment": [
          {"name": "ENVIRONMENT", "value": "${var.environment}"}
      ],
      "healthCheck": {
        "retries": 3,
        "command": [
          "CMD-SHELL",
          "find health.check -maxdepth 0 -mmin -15 | grep '.*' || exit 1"
        ],
        "timeout": 10,
        "interval": 60,
        "startPeriod": 60
      },
      "logConfiguration": {
        "logDriver": "awslogs",
        "secretOptions": null,
        "options": {
          "awslogs-group": "${local.name}",
          "awslogs-region": "${var.aws_region}",
          "awslogs-create-group": "true",
          "awslogs-stream-prefix": "${local.name}"
        }
      },
      "portMappings": [
          {
              "containerPort": 80,
              "hostPort": 8080
          }
      ],
      "entryPoint": null,
      "essential": true,
      "resourceRequirements":null
    }
  ]
  TASK_DEFINITION

}

resource "aws_ecs_cluster" "cluster" {
  name = local.name
}

resource "aws_ecs_service" "service" {
  name            = local.name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 0
  # iam_role        = "${aws_iam_role.foo.arn}"

  lifecycle {
    ignore_changes = [desired_count]
  }
}
