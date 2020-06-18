resource "aws_kms_key" "kms" {
  description = local.description
  key_usage   = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "alias" {
  name          = var.name
  target_key_id = aws_kms_key.kms.key_id
}
