output "publicip" {
  value = aws_instance.ec2.public_ip
}

output "subnet" {
  value = aws_instance.ec2.subnet_id
}