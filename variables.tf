variable environment {
  type        = string
  default     = "default"
  description = "Environment name"
}
variable "deletion_window_in_days" {
  type        = number
  default     = 10
  description = "Duration in days after which the key is deleted after destruction of the resource"
}
variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}
variable "kms_key_description" {
  type        = string
  default     = "KMS master key"
  description = "The description of the key as viewed in AWS console"
}
variable "alias" {
  type        = string
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash. If not specified, the alias name will be auto-generated."
  default = "default"
}
variable "kms_policy" {
  type        = string
  default     = ""
  description = "A valid KMS policy JSON document"
}
variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`."
}
variable "customer_master_key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`."
}
variable "is_enabled" {
  type = bool
  default = true
  description = "If the key is enabled"
}

variable "kms_admin_arn" {
  type = string
  default = ""
  description = "ARN of KMS key admin account"
}

variable "kms_user_arn" {
  type = string
  default = ""
  description = "ARN of KMS key user account"
}
