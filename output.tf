output  vpc_id {
    value = aws_vpc.myvpc.id
}

output "public_subnet1_cidr" {
    value = aws_subnet.sub1.cidr_block
  
}

output "public_subnet2_cidr" {
    value = aws_subnet.sub2.cidr_block
  
}

output "loadbalancerdns" {
    value = aws_lb.myalb.dns_name
}

output "ec2_instance_ids" {
    value = aws_instance.webserver[*].public_ip
  
}