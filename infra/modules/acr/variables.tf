# Azure Container Registry module variables

variable "name" {
  description = "Name of the Azure Container Registry"
}

variable "resource_group_name" {
  description = "Resource group for ACR"
}

variable "location" {
  description = "Azure region"
}
