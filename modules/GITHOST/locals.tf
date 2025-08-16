locals {
public_key_file = "./.key_pair/${aws_key_pair.ec2.key_name}.id_rsa.pub"
private_key_file = "./.key_pair/${aws_key_pair.ec2.key_name}.id_rsa"
  
}

resource "local_file" "private_key_pem" {
  filename = local.private_key_file
  content = tls_private_key.ec2.private_key_pem
  provisioner "local-exec" {
    command = "chmod 600 ${local.private_key_file}"
  }
}

resource "local_file" "public_key_openssh" {
  filename = local.public_key_file
  content = tls_private_key.ec2.public_key_openssh
  provisioner "local-exec" {
    command = "chmod 600 ${local.public_key_file}"
  }
}