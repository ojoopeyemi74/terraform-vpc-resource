# AMI data source 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Public Subnet data source filtering with 1 subnet in public subnet
data "aws_subnet" "public_subnet"{
    filter {
      name= "tag:Name"
      values = [ "Subnet-Public: Public-Subnet 1" ]
    }
    depends_on = [ aws_route_table_association.public_subnet_assoc ]
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = "keypair_ec2_key"
  subnet_id = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id ]
  user_data = file("${path.module}/app1-install.sh")
  associate_public_ip_address = true
  
  tags = {
    Name = "Ec2-Public-Subnet-1"
  }
}


resource "aws_key_pair" "keypair_ec2" {
  key_name   = "keypair_ec2_key"
  public_key = file("~/.ssh/id_rsa.pub") 
}