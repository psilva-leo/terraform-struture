module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}


# resource "aws_ecs_task_definition" "service" {
#   family                = "service"
#   container_definitions = file("task-definitions/service.json")

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
#   }
# }

resource "aws_ecs_cluster" "cluster" {
  name = local.name
}
