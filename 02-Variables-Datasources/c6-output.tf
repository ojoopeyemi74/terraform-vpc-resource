output "publicip" {
  value = aws_instance.my_ec2.public_ip
}

output "publicdns" {
  value = aws_instance.my_ec2.public_dns
}
