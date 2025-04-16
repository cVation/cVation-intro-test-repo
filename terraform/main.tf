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
    use_oidc             = true
    use_azuread_auth     = true
    tenant_id            = var.ARM_TENANT_ID
    client_id            = var.ARM_CLIENT_ID
    storace_account_name = "cvationthatest"
    container_name       = "learn-terraform-azure"
    key                  = "prod.terraform.tfstate"
  }

  # cloud {
  #   organization = "cVationThaTest"
  #   workspaces {
  #     name = "learn-terraform-azure"
  #   }
  # }
}

provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
}

data "azurerm_subscription" "current" {
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {}

  identity {
    type = "SystemAssigned"
  }
}