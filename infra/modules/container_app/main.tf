# Module to create an Azure Container Registry

variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "sku" {
  default = "Basic"
}
variable "admin_enabled" {
  default = true
}

resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}
