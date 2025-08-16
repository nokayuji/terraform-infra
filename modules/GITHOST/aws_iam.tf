data "aws_iam_role" "ec2_public" {
  name = "AdministratorUserRole"
}

resource "aws_iam_instance_profile" "ec2_public" {
  name = "Github-EC2-Instance-Profile"
  role = data.aws_iam_role.ec2_public.name
}
