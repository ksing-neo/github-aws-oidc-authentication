# Description: This file contains the variables that are used in the terraform code.
## Variable for AWS Region

variable "region" {
    description = "AWS Region"
    type        = string
}

## Variable for Github URL

variable "github_url" {
    description = "Github URL"
    type        = string
    default = "https://token.actions.githubusercontent.com"
}

## Variable for Github User or Oraganization

variable "github_user" {
    description = "Github User or Organization"
    type        = string
}

## Variable for Github Repository

variable "github_repository" {
    description = "Github Repository"
    type        = string
}