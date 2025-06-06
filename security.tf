resource "aws_security_group" "websg" {
  vpc_id = aws_vpc.myvpc.id


 ingress {
    description = "TLS from VPC"  
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description = "TLS from VPC"  
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  egress {
    description = "TLS from VPC"  
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    name = "Web-sg"
  }

}