terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateff15fb"  # Replace with your real name
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
