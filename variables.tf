variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
  default     = "eastus"
}

variable "app_name" {
  description = "Name of the web app"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch for deployment"
  type        = string
  default     = "main"
}
