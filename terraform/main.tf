# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
    use_oidc = true
    use_azuread_auth = true 
    tenant_id = var.ARM_TENANT_ID
    client_id = var.ARM_CLIENT_ID
    storace_account_name = "cvationthatest"
    container_name = "learn-terraform-azure"
    key = "prod.terraform.tfstate"
  }

  cloud {
    organization = "cVationThaTest"
    workspaces {
      name = "learn-terraform-azure"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "cvation-intro-virtual_network"
  address_space       = ["10.0.0.0/16"]
  location            = "west europe"
  resource_group_name = azurerm_resource_group.rg.name
}
