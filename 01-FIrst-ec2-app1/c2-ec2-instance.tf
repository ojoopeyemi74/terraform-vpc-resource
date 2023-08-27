resource "aws_instance" "myec2vm" {
  ami = "ami-0eb260c4d5475b901"
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "Ec2 Demo"
  }
}