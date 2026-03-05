# Directus Terraform CI/CD Project

This project provisions AWS infrastructure using Terraform
and deploys Directus via GitLab CI/CD using Docker Compose.

---

## 📌 Project Overview

This repository demonstrates an automated deployment of **Directus Headless CMS** on AWS EC2 using:

- **Terraform** for Infrastructure as Code (IaC)
- **GitLab CI/CD** for automation
- **AWS EC2 & Security Group configuration**
- **Docker** for containerizing Directus

This setup enables a fully automated workflow from infrastructure provisioning to application deployment, requiring no manual access after initial setup.

---

## 🧱 Architecture

The project provisions the following on AWS:

- **EC2 Instance** running Docker and Directus
- **Security Group** to allow SSH, HTTP, and Directus port access
- **Terraform Outputs** including public IP and Directus URL

The GitLab pipeline consists of multiple stages that drive the entire deployment lifecycle.

---

## 📁 Repository Structure

├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── versions.tf
├── docker-compose.yml
├── .gitlab-ci.yml
├── .gitignore
└── README.md


---

## 🛠 Technologies Used

| Technology | Purpose |
|------------|---------|
| Terraform | Infrastructure provisioning |
| AWS EC2 | Server hosting |
| GitLab CI/CD | Continuous delivery & automation |
| Docker | Containerized Directus deployment |
| Directus CMS | Headless CMS application |

---

## 🧩 Features

✔️ Fully automated Terraform provisioning  
✔️ Publicly accessible Directus site  
✔️ GitLab CI/CD pipeline with validation, planning, deployment, and cleanup  
✔️ Secure handling of secrets via GitLab Variables  
✔️ Manual control for apply and destroy steps  

---

## 🚀 GitLab CI/CD Pipeline Stages

| Stage | Description |
|-------|-------------|
| **validate** | Validate Terraform syntax & configuration |
| **plan** | Preview the infrastructure changes |
| **apply** (Manual) | Deploy infrastructure |
| **deploy** | SSH into server & run Directus via Docker |
| **test** | Validate HTTP response |
| **cleanup** (Manual) | Tear down provisioned infra |

You can find the full pipeline defined in `.gitlab-ci.yml`.

---

## 📦 Infrastructure Details

### Terraform Configuration

Example Security Group resource:

```hcl
resource "aws_security_group" "devops_sg" {
  name        = "devops-user-sg"
  description = "Security group for Directus"
  vpc_id      = var.vpc_id

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

  ingress {
    from_port   = 8055
    to_port     = 8055
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

---
Outputs:

output "directus_url" {
  value = "http://${aws_instance.directus_server.public_ip}:8055"
}

output "public_ip" {
  value = aws_instance.directus_server.public_ip
}

output "instance_id" {
  value = aws_instance.directus_server.id
}

```

## 📥 Deployment Instructions:
### 1️⃣ Setup AWS Credentials:

Add the following GitLab CI/CD variables:

|AWS_ACCESS_KEY_ID|
|AWS_SECRET_ACCESS_KEY|
|AWS_DEFAULT_REGION|
|ADMIN_EMAIL|
|ADMIN_PASSWORD|
|DB_PASSWORD|
|DIRECTUS_SECRET|

```
```

### 2️⃣ Run the Pipeline:

When you push your branch

Pipeline runs validate & plan automatically

Trigger apply manually

Deploy runs automatically

Test stage verifies Directus accessibility

```
```

## 🌐 Live Deployment:

After pipeline completion, Directus will be available at:

http://13.201.227.4/

```
```

## 🌟 Screenshots:

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(124).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(125).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(126).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(127).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(128).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(129).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(131).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(134).png?raw=true)

![image alt](https://github.com/Naveenaece2000/directus-terraform-cicd/blob/main/Screenshot%20(135).png?raw=true)

```



















