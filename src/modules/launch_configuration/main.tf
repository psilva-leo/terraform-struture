module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}


data "aws_iam_instance_profile" "profile" {
  name = "${module.defaults.role_name_prefix}${module.defaults.ec2_role_name}${module.defaults.naming_sufix}"
}

resource "aws_launch_configuration" "launch_configuration" {
  name = local.name
  image_id = module.defaults.amazon_linux_ecs
  key_name = module.defaults.key_name
  instance_type = var.instance_type
  iam_instance_profile = data.aws_iam_instance_profile.profile.arn

  enable_monitoring = var.enable_monitoring
  ebs_optimized = var.ebs_optimized
  associate_public_ip_address = var.associate_public_ip_address
  security_groups = ["sg-acc3ece7"]

  user_data = <<EOF
#!/bin/bash

type aws >/dev/null 2>&1 || { echo >&2 "AWS cli not instaled. Installing aws."; \
sudo yum install unzip -y; \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
unzip awscliv2.zip; \
sudo ./aws/install;}


# Configuring instance ResourceName Tag
REGION=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}'`
instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
resource_name="BRASA1DAPUES"$(head /dev/urandom | tr -dc 0-9 | head -c 8)

aws ec2 create-tags --region $REGION --resources $instance_id --tags "Key=ResourceName,Value=$resource_name"

# Configuring instance biding cluster
echo "ECS_CLUSTER=${local.name}" >> /etc/ecs/ecs.config
EOF
}
