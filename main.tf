module "notify_slack" {
  source               = "git::https://github.com/terraform-aws-modules/terraform-aws-notify-slack?ref=tags/v2.3.0"
  create               = true
  create_sns_topic     = var.create_sns_topic
  lambda_function_name = var.lambda_name
  slack_webhook_url    = var.slack_webhook_url
  slack_channel        = var.slack_channel
  slack_username       = var.slack_username
  slack_emoji          = var.slack_emoji
  kms_key_arn          = var.kms_key_arn
  sns_topic_name       = var.sns_topic_name
}