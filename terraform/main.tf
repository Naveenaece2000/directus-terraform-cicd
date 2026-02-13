provider "aws" {
  region = "ap-south-1"
}

# Create Security Group
resource "aws_security_group" "devops_sg" {
  name = "devops-user-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2
resource "aws_instance" "devops_user" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.devops_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              systemctl start docker
              docker run -d -p 80:8055 directus/directus
              EOF

  tags = {
    Name = "devops-user"
  }
}

output "public_ip" {
  value = aws_instance.devops_user.public_ip
}
