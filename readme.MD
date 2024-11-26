# KnowledgeCity Infrastructure Deployment with Terraform

This repository contains Terraform scripts to automate the provisioning of the KnowledgeCity infrastructure on AWS. The design ensures high availability, security, and performance across two regions: **Saudi Arabia (Primary)** and **Bahrain (Secondary)**.

---

## **Features**

1. **VPC and Networking**: Sets up a Virtual Private Cloud (VPC), subnets, and security groups.
2. **S3 Buckets with Replication**: Hosts two front-end SPAs with cross-region replication.
3. **ECS Services**: Runs the monolithic application and reporting service using ECS.
4. **Aurora Global Database**: Manages databases with global redundancy.
5. **CloudFront Distribution**: Serves static content with minimal latency.
6. **Lambda for Media Services**: Handles video encryption and other media-related tasks.
7. **IAM Roles and Policies**: Ensures secure access control.

---

## **Pre-requisites**

1. Terraform installed. [Download Terraform](https://www.terraform.io/downloads.html)
2. AWS credentials configured. You can do this via the AWS CLI:
   ```bash
   aws configure
