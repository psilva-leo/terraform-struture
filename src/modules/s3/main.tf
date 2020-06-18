module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

# Terraform does not have if-else expression. Instead, it uses 'count' to create or not a resource. It count == 0, the resource IS NOT created.

## S3 Logging default
data "aws_s3_bucket" "defaut_log_bucket" {
  count  = var.is_log_bucket ? 0 : 1
  bucket = "${module.defaults.s3_name_prefix}logs${module.defaults.naming_sufix}"
}

resource "aws_s3_bucket" "s3" {
  count = var.is_log_bucket ? 0 : 1
  bucket = local.name
  acl = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = data.aws_s3_bucket.defaut_log_bucket[0].id
    target_prefix = "log/${local.name}"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  
}

resource "aws_s3_bucket" "s3_log" {
  count  = var.is_log_bucket ? 1 : 0
  bucket = local.name
  acl    = "log-delivery-write"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  
}
