# Cloudformation template for GitHub Actions IAM OIDC Provider

## Description

This Cloudformation template creates an IAM OIDC provider for GitHub Actions and an IAM role that allows GitHub Actions to assume the role and access AWS resources. It leverages AWS IAM OIDC support to securely grant permissions to GitHub Actions workflows based on a web identity.

---

## Components:

- **AWS IAM OIDC Provider**: Configures a trust relationship between GitHub Actions and AWS using OIDC.
- **IAM Role**: Creates a role that GitHub Actions can assume, enabling access to AWS resources (e.g., S3).
- **IAM Role Policy**: Attaches a policy to the role allowing GitHub Actions to list S3 buckets.

---

## Parameters

- **Region**: The AWS region where resources will be created. (e.g., us-west-2)
- **GitHubUrl**: The URL of the GitHub OIDC provider (default is https://token.actions.githubusercontent.com).
- **GitHubUser**: The GitHub user or organization name that owns the repository.
- **GitHubRepository**: The name of the GitHub repository.
- **Thumbprint**: The thumbprint of the GitHub OIDC provider’s certificate.

---

## Variables

This Terraform configuration uses several variables. You can specify these in a `terraform.tfvars` file or pass them during execution.

---

## Outputs

The following outputs are provided by the template:

- **GitHubOIDCProviderArn**: The ARN of the GitHub OIDC provider.
- **GitHubActionsRoleArn**: The ARN of the IAM role that GitHub Actions can assume.

## Get the GitHub OIDC Thumbprint

To get the thumbprint of the GitHub OIDC provider certificate, use the bash script `get-thumbprint.sh`

Run the script on your local machine to retrieve the OIDC thumbprint. You will need to provide this thumbprint as the Thumbprint parameter when deploying the CloudFormation stack.