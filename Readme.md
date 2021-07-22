# Terraform SNS Lambda Slack
1. This module works with Terraform version 0.12+
2. This module uses the official Terraform AWS module.
3. This module creates an SNS topic and an AWS Lambda function that sends notifications to Slack using the incoming webhooks API.
4. AWS Lambda runtime Python 3.6
5. Slack message options are customizable
6. To enable slack notification, set up the webhook on your own Slack domain.
7. The resources will be created can be found in the attached file: terraform_plan.md
# Example
The example of the sns message can be found in the same repository named: sns-example.png
The example of the message in Slack can be found with name: slack-message.png

# Usage
module "notify_slack" {
  source               = "git::https://github.com/terraform-aws-modules/terraform-aws-notify-slack?ref=tags/v2.3.0"
  
  slack_webhook_url = "https://hooks.slack.com/services/A/B/C"
  slack_channel     = "Your Channel Name"
  slack_username    = "Use Name that want to use"
}