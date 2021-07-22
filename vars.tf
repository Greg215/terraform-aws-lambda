variable "region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}

variable "create_sns_topic" {
  type        = bool
  description = "Whether to create new SNS topic"
  default     = true
}

variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "test-sns-slack-lambda"
}

variable "slack_webhook_url" {
  type        = string
  description = "The URL of Slack webhook"
}

variable "slack_channel" {
  type        = string
  description = "The name of the channel in Slack for notifications"
  default     = "aws-lambda"
}

variable "slack_username" {
  type        = string
  description = "The username that will appear on Slack messages"
  default     = "Greg215"
}

variable "slack_emoji" {
  type        = string
  description = "A custom emoji that will appear on Slack messages"
  default     = ":aws:"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of the KMS key used for decrypting slack webhook url"
  default     = ""
}

variable "sns_topic_name" {
  type        = string
  description = "Name of the SNS topic to subscribe to."
  default     = ""
}