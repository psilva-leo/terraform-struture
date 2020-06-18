generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
provider "aws" {
    version = "~> 2.52.0"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
EOF
}