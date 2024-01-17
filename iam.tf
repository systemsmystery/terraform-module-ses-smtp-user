data "aws_iam_policy_document" "ses_send" {
  statement {
    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail"
    ]

    resources = [
      var.ses_identity_arn
    ]
  }
}

resource "aws_iam_policy" "ses_send" {
  name        = "ses_send_${var.project}_${replace(var.domain_name, ".", "_")}"
  description = "SES send policy for project ${var.project} and domain ${var.domain_name}"
  policy      = data.aws_iam_policy_document.ses_send.json
}

resource "aws_iam_user" "smtp_user" {
  #checkov:skip=CKV_AWS_273
  name = "ses_send_${var.project}_${replace(var.domain_name, ".", "_")}_smtp"
}

resource "aws_iam_group" "smtp_group" {
  name = "ses_send_${var.project}_${replace(var.domain_name, ".", "_")}_smtp"
}

resource "aws_iam_user_group_membership" "smtp" {
  user = aws_iam_user.smtp_user.name
  groups = [
    aws_iam_group.smtp_group.name
  ]
}

resource "aws_iam_access_key" "smtp" {
  user = aws_iam_user.smtp_user.name
}

resource "aws_iam_group_policy_attachment" "smtp" {
  group      = aws_iam_group.smtp_group.name
  policy_arn = aws_iam_policy.ses_send.arn
}
