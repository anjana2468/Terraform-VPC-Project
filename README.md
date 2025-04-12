
![Screenshot 2025-04-10 161611](https://github.com/user-attachments/assets/4fedd8e5-0e46-4b86-88a8-f623210b2013)

## 📘 Project Overview

This project **automates the deployment of a scalable web environment on AWS** using **Terraform**. It provisions:

- A custom **VPC**
- **Public subnets**
- Two **EC2 instances** with Apache installed
- A **User Data** script that creates a styled webpage
- An **Application Load Balancer (ALB)** to distribute incoming HTTP traffic

The end goal is to access a public ALB DNS in the browser and see something like this:

> 🖥️ A centered card showing:  
> ✅ EC2 Instance ID  
> ✅ Availability Zone  
> ✅ AWS Training & Certification banner  

---
## 🔧 Key Components Explained

### 1. VPC and Subnets
You create a custom VPC with two public subnets in different Availability Zones (AZs). This ensures **high availability** — if one AZ goes down, the other still serves traffic.

### 2. Security Groups
You configure a security group (`websg`) that allows HTTP (port 80) traffic so:
- ALB can access your instances
- Users can reach the website via a browser

### 3. EC2 Instances
Using a Terraform `count` of 2, you deploy **two EC2 instances** in separate subnets.

### 4. User Data Script
Each instance runs a shell script (`userdata.sh`) at launch which:
- Installs Apache
- Fetches EC2 metadata (like Instance ID and AZ)
- Writes a custom `index.html` to display this metadata beautifully

### 5. Application Load Balancer (ALB)
You create an **internet-facing ALB** with:
- Two subnets (one in each AZ)
- A listener on port 80
- A target group that includes both EC2 instances

## 🚀 How to Deploy

1. **Clone the repository**

```bash
git clone https://github.com/Terraform-VPC-Project/aws-ec2-alb-demo.git
cd Terraform-VPC-Project
```

2. **Update variables**

Edit `variables.tf` or use `terraform.tfvars` to provide:
- AMI ID
- Key pair name
- Instance type
- VPC/Subnet CIDRs

3. **Initialize Terraform**

```bash
terraform init
```

4. **Plan & Apply**

```bash
terraform plan
terraform apply
```

5. **Access the ALB DNS**
After deployment, Terraform will output a DNS name. Visit it in the browser to see the live EC2 metadata card.

![Screenshot 2025-04-12 113708](https://github.com/user-attachments/assets/097ffb31-7c4a-40c6-b294-bb250db53b37)
![Screenshot 2025-04-12 113722](https://github.com/user-attachments/assets/60f6a07c-aedb-4cf1-9102-89934dc43903)


## ✅ Benefits of This Setup

- **Scalability**: Easy to scale out by increasing `count` of EC2s.
- **High Availability**: Spread across multiple AZs.
- **Automation**: Full environment setup with one `terraform apply`.
- **Dynamic Content**: Every EC2 displays real-time instance metadata.

---


