resource "aws_sqs_queue" "default_queue" {
    name = "${var.env}-${var.name}-queue"

    redrive_policy = jsonencode({
      deadLetterTargetArn = aws_sqs_queue.deadLetter_queue.arn
      maxReceiveCount = 3
    }
    )
}

resource "aws_sqs_queue" "deadLetter_queue" {
    name = "${var.env}-${var.name}-deadletter-queue"
  
}

resource "aws_sqs_queue_redrive_allow_policy" "deadLetter_queue_redrive_allow_policy" {
    queue_url = aws_sqs_queue.deadLetter_queue.id

    redrive_allow_policy = jsonencode({
        redrivePermission = "byQueue",
        sourceQueueArns = [aws_sqs_queue.default_queue.arn]
    })
  
}

resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url = aws_sqs_queue.default_queue.id

  #SendMessageとReceiveMessage権限を、hrsre-dev01-app-serverロールを持つ操作者以外拒否する(キューポリシー)
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "DenyMessageQ",
      "Effect": "Deny",
      "Action": [
        "sqs:GetQueueUrl",
        "sqs:AddPermission",
        "sqs:ChangeMessageVisibility",
        "sqs:ReceiveMessage",
        "sqs:SendMessage",
        "sqs:CreateQueue"
      ],
      "Resource": "arn:aws:sqs:ap-northeast-1:392329150290:dev-yuji-queue"
    }
  ]
}
POLICY
}

#SQSのアクセスポリシーを設定する
resource "aws_sqs_queue_policy" "sqs_deadletterqueue_policy" {
  queue_url = aws_sqs_queue.deadLetter_queue.id

  #SendMessageとReceiveMessage権限を、hrsre-dev01-app-serverロールを持つ操作者以外拒否する(デッドレターキューポリシー)
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "DenyMessageDLQ",
      "Effect": "Deny",
      "Action": [
        "sqs:GetQueueUrl",
        "sqs:AddPermission",
        "sqs:ChangeMessageVisibility",
        "sqs:ReceiveMessage",
        "sqs:SendMessage",
        "sqs:CreateQueue"
      ],
      "Resource": "arn:aws:sqs:ap-northeast-1:392329150290:dev-yuji-deadletter-queue"
    }
  ]
}
POLICY
}


