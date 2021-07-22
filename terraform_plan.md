An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # module.notify_slack.data.aws_iam_policy_document.lambda_basic[0] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_iam_policy_document" "lambda_basic"  {
      + id   = (known after apply)
      + json = (known after apply)

      + statement {
          + actions   = [
              + "logs:CreateLogStream",
              + "logs:PutLogEvents",
            ]
          + effect    = "Allow"
          + resources = [
              + (known after apply),
            ]
          + sid       = "AllowWriteToCloudwatchLogs"
        }
    }

  # module.notify_slack.aws_cloudwatch_log_group.lambda[0] will be created
  + resource "aws_cloudwatch_log_group" "lambda" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + name              = "/aws/lambda/test-sns-slack-lambda"
      + retention_in_days = 0
      + tags_all          = (known after apply)
    }

  # module.notify_slack.aws_iam_role.lambda[0] will be created
  + resource "aws_iam_role" "lambda" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "lambda.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "lambda"
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # module.notify_slack.aws_iam_role_policy.lambda[0] will be created
  + resource "aws_iam_role_policy" "lambda" {
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "lambda-policy-"
      + policy      = (known after apply)
      + role        = (known after apply)
    }

  # module.notify_slack.aws_lambda_function.notify_slack[0] will be created
  + resource "aws_lambda_function" "notify_slack" {
      + arn                            = (known after apply)
      + filename                       = ".terraform/modules/notify_slack/functions/notify_slack.zip"
      + function_name                  = "test-sns-slack-lambda"
      + handler                        = "notify_slack.lambda_handler"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + package_type                   = "Zip"
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.7"
      + signing_job_arn                = (known after apply)
      + signing_profile_version_arn    = (known after apply)
      + source_code_hash               = "PdRsJS7OD2C/fFEmoitWCOcK1lTJ/AF3d4Zh8OkNgus="
      + source_code_size               = (known after apply)
      + tags_all                       = (known after apply)
      + timeout                        = 30
      + version                        = (known after apply)

      + environment {
          + variables = {
              + "SLACK_CHANNEL"     = "aws-lambda"
              + "SLACK_EMOJI"       = ":aws:"
              + "SLACK_USERNAME"    = "Greg215"
              + "SLACK_WEBHOOK_URL" = "***********"
            }
        }

      + tracing_config {
          + mode = (known after apply)
        }
    }

  # module.notify_slack.aws_lambda_permission.sns_notify_slack[0] will be created
  + resource "aws_lambda_permission" "sns_notify_slack" {
      + action        = "lambda:InvokeFunction"
      + function_name = "test-sns-slack-lambda"
      + id            = (known after apply)
      + principal     = "sns.amazonaws.com"
      + source_arn    = (known after apply)
      + statement_id  = "AllowExecutionFromSNS"
    }

  # module.notify_slack.aws_sns_topic.this[0] will be created
  + resource "aws_sns_topic" "this" {
      + arn                         = (known after apply)
      + content_based_deduplication = false
      + fifo_topic                  = false
      + id                          = (known after apply)
      + name                        = (known after apply)
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags_all                    = (known after apply)
    }

  # module.notify_slack.aws_sns_topic_subscription.sns_notify_slack[0] will be created
  + resource "aws_sns_topic_subscription" "sns_notify_slack" {
      + arn                             = (known after apply)
      + confirmation_timeout_in_minutes = 1
      + confirmation_was_authenticated  = (known after apply)
      + endpoint                        = (known after apply)
      + endpoint_auto_confirms          = false
      + id                              = (known after apply)
      + owner_id                        = (known after apply)
      + pending_confirmation            = (known after apply)
      + protocol                        = "lambda"
      + raw_message_delivery            = false
      + topic_arn                       = (known after apply)
    }

Plan: 7 to add, 0 to change, 0 to destroy.