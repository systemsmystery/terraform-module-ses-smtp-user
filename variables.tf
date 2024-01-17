variable "ses_identity_arn" {
  description = "The ARN of the SES identity to verify"
  type        = string
}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for the SES identity"
  type        = string
}
