data "aws_availability_zones" "a_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.ubuntu_vm.id
  instance_type = var.instance_type
  #instance_type = var.instance_type_list[2]
  #instance_type = var.instance_type_map["qa"]
  key_name      = var.keypair
  user_data     = file("${path.module}/app1-install.sh")
  # we have used for each refrencing the above data source of the available zones in the region, wish the attribute names, which will go through the names on the azs in the region 
  for_each = toset(data.aws_availability_zones.a_zones.names)
  availability_zone = each.key # you can also use each.value because for list items each.key == each.value
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.web_traffic.id]

  tags = {
    # we have also used for_each in the tag which will tag each vm with ec2-demo and each name of the azs
    Name = "ec2-demo-${each.value}"
  }
}