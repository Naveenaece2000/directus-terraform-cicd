provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "devops_sg" {
  name        = "devops-user-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-user-sg"
  }
}

# EC2 Instance
resource "aws_instance" "devops_user" {
  ami           = "ami-0f58b397bc5c1f2e8" # Ubuntu AMI for ap-south-1
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker run -d -p 80:8055 directus/directus
              EOF

  tags = {
    Name = "devops-user"
  }
}
