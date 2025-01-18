# Terraform Configuration for GitHub Actions IAM OIDC Provider

## Description

This Terraform configuration creates an IAM OIDC provider for GitHub Actions and an IAM role that allows GitHub Actions to assume the role and access AWS resources. It leverages AWS IAM OIDC support to securely grant permissions to GitHub Actions workflows based on a web identity.

---

## Components:

- **AWS IAM OIDC Provider**: Configures a trust relationship between GitHub Actions and AWS using OIDC.
- **IAM Role**: Creates a role that GitHub Actions can assume, enabling access to AWS resources (e.g., S3).
- **IAM Role Policy**: Attaches a policy to the role allowing GitHub Actions to list S3 buckets.

---

## Requirements

- **Terraform**: Version 0.12 or higher.
- **AWS Account**: IAM permissions to create OIDC providers, roles, and policies.

---

## Variables

This Terraform configuration uses several variables. You can specify these in a `terraform.tfvars` file or pass them during execution.

---

## Execution

1. Initialize Terraform: 

``` hcl
terraform init
```

2. Apply the Configuration: 

```hcl
terraform apply -var-file="terraform.tfvars"
```