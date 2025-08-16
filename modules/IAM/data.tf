# 元々マネコンから作成した情報を参照する際に使う


# IAMFullAccessポリシーを参照する iam.tf
data "aws_iam_policy" "IAMFullAccess" {
  arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

# iamユーザ、DevYuji-AWSの情報を参照する iam.tf
data "aws_iam_user" "DevYuji-AWS" {
  user_name = "DevYuji-AWS"
}

# iamユーザ、AdministratorUserの情報を参照する iam_group.tf
data "aws_iam_user" "AdministratorUser" {
  user_name = "AdministratorUser"
}

# iamユーザ、VPCReadOnlyuserの情報を参照する iam_group.tf
data "aws_iam_user" "VPCReadOnlyuser" {
  user_name = "VPCReadOnlyuser"
}
