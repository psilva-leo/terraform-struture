terraform {
  source = "/home/usr_terraform/src/applications/example"
}

include {
    path = find_in_parent_folders()
}


locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  environment = local.environment_vars.locals.environment
}

inputs = {
  environment = local.environment
}