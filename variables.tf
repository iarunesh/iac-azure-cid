variable "app_name" {
  type        = string
  description = "Name of the App Service"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  default     = "East US"
}
