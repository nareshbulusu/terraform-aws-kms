output "id" {
  value = aws_kms_key.default.id
  description = "KMS key id"
}
output "alias" {
  value = aws_kms_alias.default.name
  description = "KMS key alias"
}
output "description" {
  value = aws_kms_key.default.description
  description = "KMS key description"
}
