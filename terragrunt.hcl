locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract the variables we need for easy access
  environment = local.environment_vars.locals.environment
  aws_region   = local.region_vars.locals.aws_region
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
provider "aws" {
    version = "~> 2.52.0"
    region = "${local.aws_region}"
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "${get_env("TF_VAR_terraform_s3", "")}-${local.environment}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
