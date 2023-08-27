# using the splat operator to output the count
#Splat operator only works with count, as its a list, and for_each only works with map and set

/* output "publicip_splat_operator" {
  value = aws_instance.my_ec2[*].public_ip
} */

# using the for loop with toset to get the output
# we will convert the list to set
output "for_output_toset" {
  description = "for loop with list"
  #value = [for instance in aws_instance.my_ec2: instance.public_ip] 
  value =  toset([for instance in aws_instance.my_ec2: instance.public_ip])
}

# using the for loop with map to get the output
output "for_output_tomap" {
  description = "for loop with map"
  #value = {for instance in aws_instance.my_ec2: instance.id => instance.public_dns} 
  value = tomap({for instance in aws_instance.my_ec2: instance.id => instance.public_dns})
}

# using for loop Map advanced
# we used the c for count, it means, for tehe count in the instance resources, give the public_ip, the instance can also be replaced to anything 
output "for_output_map_advanced" {
  value = tomap({for s, instance in aws_instance.my_ec2: s => instance.public_ip})
}