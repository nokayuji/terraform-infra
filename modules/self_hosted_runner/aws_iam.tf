# IAM Instance Profile
data "aws_iam_instance_profile" "runner_ec2_profile" {
  name = "Github-EC2-Instance-Profile"
}
