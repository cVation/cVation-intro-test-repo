# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  # backend "azurerm" {
  #   use_oidc = true
  #   use_azuread_auth = true 
  #   tenant_id = var.ARM_TENANT_ID
  #   client_id = var.ARM_CLIENT_ID
  #   storace_account_name = "cvationthatest"
  #   container_name = "learn-terraform-azure"
  #   key = "prod.terraform.tfstate"
  # }

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

data "azurerm_subscription" "current" {
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = "westeurope"
#   tags = {
#     Environment = "Terraform Getting Started"
#     Team        = "DevOps"
#   }
# }

# resource "azurerm_federated_identity_credential" "github_oidc" {
#   name                = var.federated_identity_credential_name 
#   resource_group_name = var.resource_group_name
#   audience = [ var.audience_name ]
#   issuer = var.issuer_url 
#   parent_id = var.user_assigned_identity_id
#   subject = var.subject
# }

# resource "azurerm_storage_account" "account" {
#   name = var.storage_account_name
#   location = var.location
#   resource_group_name = var.resource_group_name
#   account_tier = var.account_tier
#   account_replication_type = var.account_replication_type
#   tags = var.tags
# }

# resource "azurerm_storage_container" "container" {
#   name = var.container_name
#   storage_account_name = azurerm_storage_account.account.name
#   container_access_type = "private"
# }

# module "gh_federated_credential" {
#   source                             = "../modules/federated-identity-credential"
#   federated_identity_credential_name = "${var.github_organization_target}-${var.github_repository}-${var.environment}"
#   rg_name                            = module.identity-resource-group.name
#   user_assigned_identity_id          = module.gh_usi.user_assinged_identity_id
#   subject                            = "repo:${var.github_organization_target}/${var.github_repository}:environment:${var.environment}"
#   audience_name                      = local.default_audience_name
#   issuer_url                         = local.github_issuer_url
# }

# module "gh_federated_credential-pr" {
#   source                             = "../modules/federated-identity-credential"
#   federated_identity_credential_name = "${var.github_organization_target}-${var.github_repository}-pr"
#   rg_name                            = module.identity-resource-group.name
#   user_assigned_identity_id          = module.gh_usi.user_assinged_identity_id
#   subject                            = "repo:${var.github_organization_target}/${var.github_repository}:pull_request"
#   audience_name                      = local.default_audience_name
#   issuer_url                         = local.github_issuer_url
# }

resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.sp.id

  site_config { }

  identity {
    type = "SystemAssigned"
  }
}