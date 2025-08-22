# IAM Instance Profile
resource "aws_iam_instance_profile" "terraform_ec2_profile" {
  name = "${var.sys}-${var.env}-terraform-ec2-role"
  role = aws_iam_role.terraform_ec2_role.name
}

# ec2 Instance Profile用IAM Role
resource "aws_iam_role" "terraform_ec2_role" {
  name = "${var.sys}-${var.env}-terraform-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# IAM ポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "terraform_ec2_attach" {
  role       = aws_iam_role.terraform_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# resource "aws_iam_policy" "ec2_custom_1" {
#   name = "${var.sys}-${var.env}-ec2-policy"

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [{
#       "Sid" : "VisualEditor0",
#       "Effect" : "Allow",
#       "Action" : [
#         "ec2:DescribeInstance",
#         "ec2:DescribeTags"
#       ],
#       "Resource" : "*"
#     }]
#   })
# }

# # カスタムポリシーのアタッチ
# resource "aws_iam_role_policy_attachment" "ec2_custom_1_attach" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = aws_iam_policy.ec2_custom_1.arn
# }

