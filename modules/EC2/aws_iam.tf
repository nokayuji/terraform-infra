# ec2 Instance Profile用IAM Role
resource "aws_iam_role" "ec2_role" {
  name = "${var.sys}-${var.env}-ec2-role"

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

# IAM Policy Attachment (例: SSM)
resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# IAM ポリシーのアタッチ - PowerUserAccess
resource "aws_iam_role_policy_attachment" "poweruser_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_policy" "ec2_custom_1" {
  name = "${var.sys}-${var.env}-ec2-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Sid" : "VisualEditor0",
      "Effect" : "Allow",
      "Action" : [
        "ec2:DescribeInstance",
        "ec2:DescribeTags"
      ],
      "Resource" : "*"
    }]
  })
}

# カスタムポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "ec2_custom_1_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_custom_1.arn
}

resource "aws_iam_policy" "ec2_custom_2" {
  name = "${var.sys}-${var.env}-zabbix-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Sid" : "VisualEditor0",
      "Effect" : "Allow",
      "Action" : [
        "rds:Describe*",
        "cloudwatch:List*",
        "cloudwatch:Get*",
        "cloudwatch:Describe*",
        "SNS:Publish"
      ],
      "Resource" : "*"
    }]
  })
}

# カスタムポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "ec2_custom_2_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_custom_2.arn
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.sys}-${var.env}-ec2-poweruser-role"
  role = aws_iam_role.ec2_role.name
}
