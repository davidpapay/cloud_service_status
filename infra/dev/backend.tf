terraform {
  backend "azurerm" {
    resource_group_name  = "infra-rg"
    storage_account_name = "tfstatestoragecss"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}