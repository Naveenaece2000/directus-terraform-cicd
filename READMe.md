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



