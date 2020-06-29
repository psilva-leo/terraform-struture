module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

module "launch_configuration" {
  source = "/home/usr_terraform/src/modules/launch_configuration"
  name = var.name
  environment = var.environment
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
}

resource "aws_autoscaling_group" "asg" {
  name              = local.name
  max_size          = var.max_size
  min_size          = var.min_size
  health_check_type = "EC2"

  launch_configuration = module.launch_configuration.id
  vpc_zone_identifier  = module.defaults.default_vpc_public_subnets

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

}
