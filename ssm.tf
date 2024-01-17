resource "aws_ssm_parameter" "smtp_id" {
  # checkov:skip=CKV_AWS_337
  name  = "/${var.project}/${replace(var.domain_name, ".", "_")}/smtp/id"
  type  = "SecureString"
  value = aws_iam_access_key.smtp.id
}

resource "aws_ssm_parameter" "smtp_password" {
  # checkov:skip=CKV_AWS_337
  name  = "/${var.project}/${replace(var.domain_name, ".", "_")}/smtp/password"
  type  = "SecureString"
  value = aws_iam_access_key.smtp.ses_smtp_password_v4
}
