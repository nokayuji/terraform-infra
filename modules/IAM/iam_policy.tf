# SQSの権限を実行するためのポリシー
resource "aws_iam_policy" "sqs-custumer-roll-policy" {
  name        = "sqs-custumer-roll-policy"
  path        = "/"
  description = "for SQSexerole policy"

# SQSを運用する上での最小限のポリシーをアクションに付与する
  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:SendMessage",
          "sqs:CreateQueue",
          "sqs:ListQueues",
          "sqs:ListDeadLetterSourceQueues",
          "sqs:ListMessageMoveTasks",
          "sqs:ListQueueTags",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl"
        ],
        "Resource" : "*"
      }
    ]
  })
}