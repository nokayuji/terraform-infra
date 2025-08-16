locals {
  ec2_instances = {
    ac-ec2-01 = {
      instance_type = var.instance_type["ap-ec2-01"]
      subnet_id     = var.subnet_id_1a
      sg_group = [
        aws_security_group.ec2_test2.id,
        aws_security_group.ec2_sg.id
      ]
      volume_size = 1
    }
    ac-ec2-02 = {
      instance_type = var.instance_type["ap-ec2-02"]
      subnet_id     = var.subnet_id_1c
      sg_group = [
        aws_security_group.ec2_test2.id,
      ]
      volume_size = 2
    }
    stream-ec2-01 = {
      instance_type = var.instance_type["stream-ec2-01"]
      subnet_id     = var.subnet_id_1a
      sg_group = [
        aws_security_group.ec2_test2.id,
        aws_security_group.ec2_sg.id
      ]
      volume_size = 3
    }
    stream-ec2-02 = {
      instance_type = var.instance_type["stream-ec2-02"]
      subnet_id     = var.subnet_id_1c
      sg_group = [
        aws_security_group.ec2_test3.id,
      ]
      volume_size = 4
    }
    sso-ec2-01 = {
      instance_type = var.instance_type["sso-ec2-01"]
      subnet_id     = var.subnet_id_1a
      sg_group = [
        aws_security_group.ec2_test2.id,
        aws_security_group.ec2_test3.id
      ]
      volume_size = 5
    }
    sso-ec2-02 = {
      instance_type = var.instance_type["sso-ec2-02"]
      subnet_id     = var.subnet_id_1c
      sg_group = [
        aws_security_group.ec2_sg.id
      ]
      volume_size = 6
    }
  }
}
