# Block to create EC2
resource "aws_instance" "web" {
  ami                       = "ami-06ef3429338c1779f"
  instance_type             = "t3.nano"
  vpc_security_group_ids    = [aws_security_group.allow_ssh_sg.id]

  tags = {
    Name        = "Terraform-Instance-Server-Name"
  }
}

# Block to print the attribute 
output "private_dns_of_server" {
    value       = aws_instance.web.private_dns
}

# Creatting a security group instamce
resource "aws_security_group" "allow_ssh_sg" {
  name        = "b5_allow_ssh_sg"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "b5_allow_ssh_sg"
  }
}