variable "location" {
  type        = string
  description = "Azure region"
  default     = "Central India"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

output "rg_name" {
  value = azurerm_resource_group.this.name
}
