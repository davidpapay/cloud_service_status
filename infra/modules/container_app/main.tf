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
  
  # ACR configuration
  secret {
    name  = "acr-password"
    value = var.registry_password
  }
  registry {
    server               = var.registry_server
    username             = var.registry_username
    password_secret_name = "acr-password"
  }

  # Container configuration
  template {
    container {
      name   = var.name
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory
    }
  }


# Ingress(inbound network) configuration
 ingress {
    # Enable external access
    external_enabled = true
    target_port      = 8000

    traffic_weight {
      percentage      = 100
      # Route all traffic to the latest revision
      latest_revision = true
    }
  }
}