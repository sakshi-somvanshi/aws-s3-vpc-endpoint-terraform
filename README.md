# AWS S3 VPC Endpoint – Secure Private Access Using Terraform

A secure, zero-internet AWS architecture built with Terraform. An EC2 instance runs in a private subnet without a public IP and accesses Amazon S3 through an **S3 Gateway VPC Endpoint**. Least-privilege IAM permissions and an endpoint policy restrict access to authorized resources. **AWS Systems Manager Session Manager** is used for secure instance access, and downloading a test file from S3 verifies that private connectivity works without internet access.

## Architecture

![Architecture Diagram](images/architecture_diagram.png)

## What gets created

- VPC `dev-vpc` (10.0.0.0/16) with 3 public and 3 private subnets
- Public and private route tables, Internet Gateway `dev-igw`
- Security groups: `dev-private-ec2-sg`, `dev-endpoint-sg`
- VPC endpoints: S3 (Gateway) and SSM, SSM Messages, EC2, EC2 Messages, STS (Interface)
- Private EC2 instance `dev-private-ec2` (t3.micro, no public IP) with an IAM role for SSM and S3 read access
- Private S3 bucket `sakshi-private-ssm-demo-bucket-123` with a `test.txt` object

## Project structure

```
.
├── environments/
│   └── aws-vpc-endpoints-demo/
│       ├── network/
│       └── endpoints-demo/
├── modules/
│   └── aws-vpc-s3-endpoints/
│       ├── vpc/
│       ├── security-group/
│       ├── iam/
│       ├── ec2/
│       ├── s3/
│       └── endpoint-policy/
├── docs/
└── images/
```

## How to deploy

```bash
cd environments/aws-vpc-endpoints-demo/network
terraform init
terraform apply

cd ../endpoints-demo
terraform init
terraform apply
```

## How to verify

Connect to `dev-private-ec2` using Session Manager and run:

```bash
aws sts get-caller-identity
aws s3 cp s3://sakshi-private-ssm-demo-bucket-123/test.txt ./
cat test.txt
```

The file downloads through the S3 Gateway VPC Endpoint, without any public IP or internet route.

## Documentation

Step-by-step documentation with AWS Console screenshots:
[Project Documentation (PDF)](docs/AWS_S3_VPC_Endpoint_Project_Documentation_Sakshi_Somvanshi.pdf)

## Clean up

```bash
cd environments/aws-vpc-endpoints-demo/endpoints-demo && terraform destroy
cd ../network && terraform destroy
```

## Author

**Sakshi Somvanshi**