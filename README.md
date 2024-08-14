# AWS Infrastructure with Terraform

This repository contains Terraform configurations to provision essential AWS resources, including a VPC, subnets, EC2 instances, and a PostgreSQL RDS instance. These resources form the backbone of a basic cloud infrastructure setup, suitable for running web applications or other services on AWS.

## Table of Contents

- [Overview](#overview)
- [AWS Resources](#aws-resources)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Terraform Configuration](#terraform-configuration)
- [Outputs](#outputs)
- [Cleanup](#cleanup)
- [Contributing](#contributing)
- [License](#license)

## Overview

This Terraform configuration automates the deployment of a network and compute environment on AWS. The infrastructure includes:

- A Virtual Private Cloud (VPC) with subnets.
- EC2 instances for compute.
- A PostgreSQL RDS instance for database storage.

## AWS Resources

### The following AWS resources are created by this configuration:

- **VPC:** A custom Virtual Private Cloud to isolate the infrastructure.
- **Subnets:** Public and private subnets distributed across availability zones.
- **EC2 Instance:** A compute instance running in the specified subnet.
- **RDS Instance:** A managed PostgreSQL database instance.

## Prerequisites

Before you begin, ensure you have the following:

- **Terraform:** Installed on your local machine. Version 0.12 or later is recommended.
- **AWS CLI:** Configured with appropriate credentials and default region.
- **AWS Account:** With sufficient permissions to create the resources.

## Usage

### Step 1: Clone the Repository

```bash
git clone https://github.com/Maulik-A/terraform_aws_infra.git
cd aws-terraform-infra
```

### Step 2: Initialize Terraform

Initialize the working directory containing the Terraform configuration files.

```bash
terraform init
```

### Step 3: Review and Apply Configuration

Before applying, review the Terraform plan to understand the resources that will be created or modified.

```bash
terraform plan
```

If the plan looks good, apply the configuration to create the resources.

```bash
terraform apply
```

### Step 4: Access the Resources

Once the apply operation is complete, you can access your AWS resources as per the outputs. 

## Terraform Configuration

The Terraform configuration is organized into modules and resource files, including:

- `vpc.tf`: Defines the VPC and subnets.
- `main.tf`: Defines the EC2 instance,the PostgreSQL RDS instance.
- `variables.tf`: Contains input variables for customization.
- `security_group.tf`: Defines the security group for inbound and outbound traffic.
-  Note: You need to create SSH credentials that used to SSH to EC2 instance. Follow this steps. https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/create-with-openssh/

## Outputs

After running `terraform apply`, the following outputs will be available:

- **VPC ID:** The ID of the created VPC.
- **Subnet IDs:** The IDs of the created subnets.
- **EC2 Instance Public IP:** The public IP address of the EC2 instance.
- **RDS Endpoint:** The connection endpoint for the PostgreSQL RDS instance.

## Cleanup

To remove all the resources created by this configuration, run:

```bash
terraform destroy
```

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
