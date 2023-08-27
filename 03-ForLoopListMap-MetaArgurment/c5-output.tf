# using the splat operator to output the count
output "publicip_splat_operator" {
  value = aws_instance.my_ec2[*].public_ip
}

# using the for loop with list to get the output
output "for_output_list" {
  description = "for loop with list"
  value = [for instance in aws_instance.my_ec2: instance.public_ip] 
}

# using the for loop with map to get the output
output "for_output_map" {
  description = "for loop with map"
  value = {for instance in aws_instance.my_ec2: instance.id => instance.public_dns} 
}

# using for loop Map advanced
# we used the c for count, it means, for tehe count in the instance resources, give the public_ip, the instance can also be replaced to anything 
output "for_output_map_advanced" {
  value = {for c, instance in aws_instance.my_ec2: c => instance.public_ip}
}