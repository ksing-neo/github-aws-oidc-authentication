# Description: This Terraform configuration creates an IAM OIDC provider for GitHub Actions and an IAM role that allows GitHub Actions to assume the role and access AWS resources.

# Step 0: Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Step 1: Get the Github Thumbprint

data "tls_certificate" "github_oidc" {
  url = "${var.github_url}:443"
}

# Step 2: Create IAM OIDC provider for GitHub
resource "aws_iam_openid_connect_provider" "github" {
  url                   = "${var.github_url}"
  client_id_list        = ["sts.amazonaws.com"]
  thumbprint_list       = [data.tls_certificate.github_oidc.certificates[0].sha1_fingerprint]
}

# Step 3: Create IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions" {
  name               = "GitHubActionsRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_user}/${var.github_repository}:*"
          }
        }
      }
    ]
  })
}

# Step 4: Attach policies to the IAM Role
resource "aws_iam_role_policy" "github_actions_policy" {
  role = aws_iam_role.github_actions.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:ListAllMyBuckets"
        ]
        Resource = [
          "arn:aws:s3:::*"
        ]
      }
    ]
  })
}
