# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "this" {
  name              = "${var.name}-law"
  location          = var.location
  resource_group_name = var.resource_group_name
  sku               = "PerGB2018"
  retention_in_days = 30
}

# Container App Environment
resource "azurerm_container_app_environment" "this" {
  name                       = "${var.name}-cae"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}

# Container App
resource "azurerm_container_app" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.this.id
  revision_mode                = "Single"

  template {
    container {
      name   = var.name
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory
    }
  }
}
