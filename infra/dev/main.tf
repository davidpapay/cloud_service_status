# Main Terraform configuration file - Development environment

# Azure Resource Group
resource "azurerm_resource_group" "this" {
  name     = "rg-cloud-service-status-dev"
  location = "westeurope"
}

# Azure ACR module instance
module "acr" {
  source              = "../modules/acr"
  name                = "acrcloudservicestatusdev"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

# Azure Container App module instance
module "app" {
  source              = "../modules/container_app"
  name                = "cloud-service-status-dev"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  container_image     = "acrcloudservicestatusdev.azurecr.io/cloud-service-status:latest"
  registry_server   = module.acr.login_server
  registry_username = module.acr.username
  registry_password = module.acr.password
}