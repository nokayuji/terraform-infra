resource "aws_instance" "ec2" {
  ami           = "ami-0ca38c7440de1749aa"
  instance_type = "t1.micro"
  tags = {
    Name = "tflint-test"
  }
}
