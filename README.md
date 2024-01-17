# Terraform Module - SES SMTP User

This module creates an SES SMTP user.

The user is will be called `ses_send{{ project }}_{{ domain }}` and will have a group called
`ses_send{{ project }}_{{ domain }}_smtp` (Following best practice.

The secret access keys are stores in SSM under `/{{ project }}/{{ domain }}/smtp`

## Terraform Resources

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.smtp](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/iam_access_key) | resource |
| [aws_iam_group.smtp_group](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.smtp](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.ses_send](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/iam_policy) | resource |
| [aws_iam_user.smtp_user](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.smtp](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/iam_user_group_membership) | resource |
| [aws_ssm_parameter.smtp_id](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.smtp_password](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/ssm_parameter) | resource |
| [aws_iam_policy_document.ses_send](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use for the SES identity | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the project | `string` | n/a | yes |
| <a name="input_ses_identity_arn"></a> [ses\_identity\_arn](#input\_ses\_identity\_arn) | The ARN of the SES identity to verify | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
