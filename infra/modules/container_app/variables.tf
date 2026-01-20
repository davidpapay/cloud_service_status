variable "name" {
  description = "Base name for all resources"
}

variable "resource_group_name" {
  description = "Resource group where all resources are deployed"
}

variable "location" {
  description = "Azure region"
}

variable "container_image" {
  description = "Docker image for the Container App"
}

variable "registry_server" {}
variable "registry_username" {}
variable "registry_password" {
  sensitive = true
}

variable "cpu" {
  description = "CPU for container"
  default     = 0.25
}

variable "memory" {
  description = "Memory for container"
  default     = "0.5Gi"
}
