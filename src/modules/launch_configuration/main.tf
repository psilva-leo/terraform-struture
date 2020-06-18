module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

resource "aws_launch_configuration" "launch_configuration" {
  name = local.name
  image_id = module.defaults.amazon_linux_ecs
  key_name = module.defaults.key_name
  instance_type = var.instance_type

  enable_monitoring = false
  ebs_optimized = false
  associate_public_ip_address = false
  security_groups = ["sg-acc3ece7"]

  user_data = <<EOF
#!/bin/bash
echo "ECS_CLUSTER=${local.name}" >> /etc/ecs/ecs.config
EOF
}
