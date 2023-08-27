resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.ubuntu_vm.id
  instance_type = var.instance_type
  key_name      = var.keypair
  user_data     = file("${path.module}/app1-install.sh")

  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.web_traffic.id]

  tags = {
    Name = "ec2 Demo"
  }
}