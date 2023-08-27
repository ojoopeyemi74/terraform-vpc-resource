resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.ubuntu_vm.id
  #instance_type = var.instance_type
  instance_type = var.instance_type_list[2]
  #instance_type = var.instance_type_map["qa"]
  key_name      = var.keypair
  user_data     = file("${path.module}/app1-install.sh")
  count = 2
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.web_traffic.id]

  tags = {
    Name = "ec2 Demo-${count.index}"
  }
}