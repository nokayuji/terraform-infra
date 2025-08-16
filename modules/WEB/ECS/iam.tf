## ECS タスク実行ロール・・・タスク実行時にアクセスしたいAWSリソースの権限を管理
resource "aws_iam_role" "exec_ecs_task_web" {
  name               = "dev-ecs-exec-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_policy.json
}

data "aws_iam_policy_document" "ecs_assume_policy" {
  version = "2012-10-17"

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "exec_policy_attachment_web" {
  role       = aws_iam_role.exec_ecs_task_web.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


## ECS タスクロールタスク実行して起動したコンテナがアクセスしたいAWSリソースの権限を管理
#resource "aws_iam_role" "ecs_task_role" {
#  name               = "dev-ecs-task-role"
#  assume_role_policy = data.aws_iam_policy_document.ecs_assume_policy.json
#}
#
#resource "aws_iam_policy" "for_ssmmessages_policy" {
#  name   = dev-for-ssmmessages-policy
#  policy = data.aws_iam_policy_document.for_ssmmessages_policy.json
#}

#data "aws_iam_policy_document" "for_ssmmessages_policy" {
#  version = "2012-10-17"
#
#  statement {
#    effect = "Allow"
#    actions = [
#      "ssmmessages:CreateControlChannel",
#      "ssmmessages:CreateDataChannel",
#      "ssmmessages:OpenControlChannel",
#      "ssmmessages:OpenDataChannel",
#    ]
#    resources = ["*"]
#  }
#}
#
#resource "aws_iam_role_policy_attachment" "ecs_task_role_for_ssmmessages" {
#  role       = aws_iam_role.ecs_task_role.name
#  policy_arn = aws_iam_policy.for_ssmmessages_policy.arn
#}
