

# SQSの権限を実行するためのロール
resource "aws_iam_role" "SQSexerole" {
  name = "SQSexerole"

  # ロールに付与する信頼ポリシー(developer1ユーザがスイッチロール可能なassumerole)
  assume_role_policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::392329150290:user/developer1"
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {}
      }
    ]
  })
}

# SQSの権限を実行するためのポリシーをSQSexeroleにアタッチする
resource "aws_iam_policy_attachment" "sqs-custumer-roll-policy-attach" {
  name       = "sqs-custumer-roll-policy-attachment"
  roles      = [aws_iam_role.SQSexerole.name]
  policy_arn = aws_iam_policy.sqs-custumer-roll-policy.arn
}

# Admin権限がついたロール
resource "aws_iam_role" "AdministratorUserRole" {
  name = "AdministratorUserRole"

  # ロールに付与する信頼ポリシー(developer1、DevYuji-AWSユーザがスイッチロール可能なassumerole)
  assume_role_policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : [
            "arn:aws:iam::392329150290:user/developer1",
            "arn:aws:iam::392329150290:user/DevYuji-AWS"
          ]
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {}
      }
    ]

  })
}

# AdministratorAccessポリシーをAdministratorUserRoleにアタッチする
resource "aws_iam_policy_attachment" "AdministratorAccess-policy-attach" {
  name       = "AdministratorAccess-policy-attachment"
  roles      = [aws_iam_role.AdministratorUserRole.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  groups     = [aws_iam_group.Administrator.name] #これを記載していないとAdministratorAccessGroup　にアタッチされているアドミンポリシーが削除される
}
