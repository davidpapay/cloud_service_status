# Main Terraform configuration file - Production environment

# Azure resource group
resource "azurerm_resource_group" "cloud_service_status_rg" {
  name     = "rg-cloud-service-status-prod"
  location = "westeurope"
}

# Azure Container Registry module instance
module "cloud_service_status_acr" {
  source              = "../modules/container_app"
  name                = "acrcloudservicestatusprod"
  resource_group_name = azurerm_resource_group.cloud_service_status_rg.name
  location            = azurerm_resource_group.cloud_service_status_rg.location
  container_image     = "acrcloudservicestatusprod.azurecr.io/cloud-service-status:latest"
}
