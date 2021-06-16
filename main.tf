locals {
  repo_short_name = "kms-key"
  default_kms_policy = templatefile("${path.module}/resources/kms-policy-tmpl.json", {
    aws_account_id = data.aws_caller_identity.default.account_id
    kms_admin_arn = var.kms_admin_arn != "" ? var.kms_admin_arn : data.aws_caller_identity.default.arn
    kms_user_arn = var.kms_user_arn != "" ? var.kms_user_arn : data.aws_caller_identity.default.arn
  })
}

data "aws_caller_identity" "default" {}

resource "aws_kms_key" "default" {
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.kms_policy == "" ? local.default_kms_policy: var.kms_policy
  description              = var.kms_key_description
  key_usage                = var.key_usage
  is_enabled = var.is_enabled
  customer_master_key_spec = var.customer_master_key_spec
    tags                     =     {
    Name         = var.alias
    Environment  = var.environment
    platform_IAC_Source  = "terraform-aws-${local.repo_short_name}"
}
}

resource "aws_kms_alias" "default" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.default.id
}
