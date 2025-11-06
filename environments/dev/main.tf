terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

# Global Resource Group
module "resource_group" {
  source              = "../../global/resource_groups"
  resource_group_name = "tf-dev-rg"
  location            = var.location
}

# Network Module
module "network" {
  source              = "../../modules/network"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
  vnet_name           = "tf-dev-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_prefix       = ["10.0.1.0/24"]
}

# Compute Module
module "compute" {
  source              = "../../modules/compute"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  vm_name             = "tf-dev-vm"
}
