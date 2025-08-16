
# AdministratorAccessGroup　IAMグループの作成
resource "aws_iam_group" "Administrator" {
  name = "AdministratorAccessGroup"
}

# AdministratorAccessGroupにAdmin権限を付与する
resource "aws_iam_group_policy_attachment" "AdministratorAccess-attach" {
  group      = aws_iam_group.Administrator.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# AdministratorAccessGroupにAdministratorUserを追加する
resource "aws_iam_group_membership" "Administratorteam" {
  name = "Administrator-group-membership"

  users = [
    data.aws_iam_user.AdministratorUser.user_name
  ]

  group = aws_iam_group.Administrator.name
}

# VPCReadOnlyGroup　IAMグループの作成
resource "aws_iam_group" "VPCReadOnlyGroup" {
  name = "VPCReadOnlyGroup"
}

# VPCReadOnlyGroupにVPCReadOnlyAccess権限を付与
resource "aws_iam_group_policy_attachment" "VPCReadOnly-attach" {
  group      = aws_iam_group.VPCReadOnlyGroup.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"
}

# AdministratorAccessGroupにVPCReadOnlyuserを追加する
resource "aws_iam_group_membership" "VPCReadOnlyteam" {
  name = "VPCReadOnlyGroup-membership"

  users = [
    data.aws_iam_user.VPCReadOnlyuser.user_name
  ]

  group = aws_iam_group.VPCReadOnlyGroup.name
}

# IAMFullAccessGroup　IAMグループの作成
resource "aws_iam_group" "IAMFullAccessGroup" {
  name = "IAMFullAccessGroup"
}
