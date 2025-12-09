# Main Terraform configuration file

# Azure resource group
resource "azurerm_resource_group" "cloud_service_status_rg" {
  name     = "rg-cloud-service-status-dev"
  location = "westeurope"
}
