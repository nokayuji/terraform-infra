# DevYuji-AWS.userにIAMFullAccessポリシーをアタッチする
resource "aws_iam_policy_attachment" "IAMFullAccess-policy-attach" {
  name       = "IAMFullAccess-policy-attachment"
  users      = [data.aws_iam_user.DevYuji-AWS.user_name]
  policy_arn = data.aws_iam_policy.IAMFullAccess.arn
}
