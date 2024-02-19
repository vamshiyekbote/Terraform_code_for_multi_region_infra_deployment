# Multi-Region AWS Infrastructure with Terraform

This repository contains Terraform scripts for deploying a multi-region AWS infrastructure with modular components, including VPC, Security Groups, EC2, S3, RDS, and WordPress.

## Table of Contents
- [Getting Started](#getting-started)
- [Modules](#modules)
- [Usage](#usage)
- [Variables](#variables)
- [Outputs](#outputs)
- [Best Practices](#best-practices)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites
- Terraform installed on your machine
- AWS credentials configured with necessary permissions

### Installation
1. Clone this repository.
2. Navigate to the `terraform` directory.
3. Run `terraform init` to initialize the project.

## Modules

### 1. VPC
- Creates an AWS Virtual Private Cloud.

### 2. Security Groups
- Manages AWS Security Groups.

### 3. EC2 Instance
- Provisions an EC2 instance within the VPC.

### 4. S3 Bucket
- Creates an S3 bucket for storing static assets.

### 5. RDS
- Sets up a MySQL RDS instance.

### 6. WordPress
- Installs and configures WordPress on an EC2 instance.

### 7. ALB or DNS
- Configures an Application Load Balancer or DNS for the WordPress service.

## Usage

1. Modify variables in `terraform/variables.tf` according to your requirements.
2. Execute `terraform apply` to create the infrastructure.

## Variables

- Detailed information about input variables can be found in each module's respective `variables.tf` file.

## Outputs

- Information about the created resources will be displayed after running `terraform apply`.

## Best Practices

- Follow Terraform and AWS best practices, including tagging resources and implementing the principle of least privilege in IAM roles.

## Contributing

Feel free to contribute by opening issues or submitting pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
