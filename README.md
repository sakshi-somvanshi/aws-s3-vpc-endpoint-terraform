# AWS S3 VPC Endpoint – Secure Private Access Using Terraform

<p align="center">
  <img src="https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws" />
  <img src="https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform" />
  <img src="https://img.shields.io/badge/Amazon-S3-569A31?logo=amazons3" />
  <img src="https://img.shields.io/badge/Status-Completed-success" />
</p>

## 🚀 Project Overview

This project focuses on building a secure and modular AWS infrastructure using **Terraform (Infrastructure as Code)**.

The primary objective is to enable private communication between an EC2 instance and Amazon S3 through an **S3 Gateway VPC Endpoint**.

The infrastructure includes a custom VPC, public and private subnets, route tables, Internet Gateway, EC2 instances, IAM roles, security groups, S3 bucket configuration, and VPC endpoint policies.

Terraform modules are used to organize infrastructure components, making the configuration reusable, manageable, and scalable.

The project demonstrates how AWS resources can communicate securely without sending S3 traffic through the public internet.

## 🎯 Project Objectives

- Automate AWS infrastructure provisioning using Terraform.
- Design a custom VPC with public and private subnets.
- Configure route tables and Internet Gateway.
- Deploy EC2 instances in a private subnet.
- Establish private S3 connectivity using a Gateway VPC Endpoint.
- Implement IAM roles and least-privilege permissions.
- Configure endpoint policies for controlled S3 access.
- Validate connectivity using AWS CLI.
- Manage infrastructure lifecycle using Terraform.

## 🏗️ Architecture Overview

The architecture uses a custom AWS VPC with separate public and private network segments.

**Traffic Flow:**

```text
                  AWS CLOUD
                      |
                  Custom VPC
                      |
          -------------------------
          |                       |
     Public Subnets          Private Subnets
          |                       |
    Internet Gateway         Private EC2
                                  |
                              Route Table
                                  |
                         S3 Gateway Endpoint
                                  |
                              Amazon S3
```

The S3 Gateway Endpoint provides private connectivity between resources in the VPC and Amazon S3 through AWS networking.

## 🛠️ Technologies & AWS Services

| Technology | Description |
|---|---|
| AWS VPC | Network isolation |
| Amazon EC2 | Compute infrastructure |
| Amazon S3 | Object storage |
| S3 Gateway Endpoint | Private S3 connectivity |
| AWS IAM | Identity and access management |
| Security Groups | Network traffic control |
| Route Tables | Traffic routing |
| Internet Gateway | Public subnet connectivity |
| AWS Systems Manager | Secure instance management |
| Terraform | Infrastructure as Code |
| Git & GitHub | Version control |

## 📁 Project Structure

```text
AWS-VPC-Endpoint/
│
├── endpoint-demo/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── network/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
└── modules/
    ├── ec2/
    ├── iam/
    ├── s3/
    ├── vpc/
    ├── security-group/
    └── endpoint-policy/
```

## ⚙️ Implementation Workflow

### 1. Network Infrastructure

- Created a custom VPC using Terraform.
- Configured public and private subnets.
- Created and attached an Internet Gateway.
- Configured public and private route tables.
- Established subnet associations.

### 2. Security Configuration

- Created EC2 security groups.
- Configured inbound and outbound traffic rules.
- Implemented network access restrictions.

### 3. IAM Configuration

- Created IAM roles and policies.
- Configured permissions for EC2 to access S3.
- Applied least-privilege access principles.

### 4. Amazon S3 Configuration

- Configured an S3 bucket.
- Applied the required access permissions.
- Prepared a test object for connectivity verification.

**S3 Bucket:** `terraform-remote-backend-fct-batch`

### 5. S3 Gateway VPC Endpoint

- Created an S3 Gateway VPC Endpoint.
- Associated the endpoint with the private route table.
- Configured an endpoint policy.
- Enabled private S3 traffic routing.

### 6. EC2 Deployment

- Provisioned an EC2 instance in the private subnet.
- Attached the required IAM instance role.
- Configured secure instance access.

### 7. Connectivity Testing

- Accessed the private EC2 instance through AWS Systems Manager Session Manager.
- Verified S3 connectivity using AWS CLI.
- Downloaded and checked the test object.

## 🔐 Security Implementation

Security was a key consideration throughout the project.

- Private subnet deployment for EC2.
- IAM-based access control.
- Least-privilege permissions.
- S3 Gateway Endpoint policy restrictions.
- Security group traffic management.
- Private S3 connectivity without requiring public internet access for S3 traffic.
- Secure EC2 management using Systems Manager.

## 🧪 Validation & Testing

The following AWS CLI commands can be used to validate S3 access from the EC2 instance.

**Verify AWS Identity**

```bash
aws sts get-caller-identity
```

**List S3 Bucket Objects**

```bash
aws s3 ls s3://terraform-remote-backend-fct-batch/
```

**Download Test File**

```bash
aws s3 cp s3://terraform-remote-backend-fct-batch/test.txt .
```

**Read File Contents**

```bash
cat test.txt
```

**Validation Result:** S3 access was tested from the private EC2 instance through the configured S3 Gateway VPC Endpoint.

## 🧹 Infrastructure Cleanup

After completing the implementation and validation, Terraform was used to manage infrastructure cleanup.

```bash
terraform destroy
```

This helps avoid unnecessary AWS resource charges.

## 📚 Key Learnings

- AWS VPC networking and subnet architecture.
- Public and private network segmentation.
- Terraform modules and reusable infrastructure.
- S3 Gateway VPC Endpoint implementation.
- IAM roles and policies.
- EC2 private subnet deployment.
- AWS CLI and connectivity validation.
- Infrastructure lifecycle management.

## 📖 References

- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [Amazon S3 Documentation](https://docs.aws.amazon.com/s3/)
- [AWS VPC Endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/gateway-endpoints.html)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## 👩‍💻 Author

**Sakshi Somvanshi**

**Cloud & DevOps Enthusiast**

---

⭐ If you find this project useful, feel free to explore the repository!