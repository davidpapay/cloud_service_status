# Main Terraform configuration file - Development environment

# Azure Resource Group
resource "azurerm_resource_group" "cloud_service_status_rg" {
  name     = "rg-cloud-service-status-dev"
  location = "westeurope"
}

# Azure Container App module instance
module "cloud_service_status" {
  source              = "../modules/container_app"
  name                = "cloud-service-status-dev"
  resource_group_name = azurerm_resource_group.cloud_service_status_rg.name
  location            = azurerm_resource_group.cloud_service_status_rg.location
  container_image     = "acrcloudservicestatusdev.azurecr.io/cloud-service-status:latest"
}
