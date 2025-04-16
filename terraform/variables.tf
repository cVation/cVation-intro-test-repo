variable "resource_group_name" {
  default = "cvation-intro-terraform-resource-group"
  type    = string
}

variable "service_plan_name" {
  default = "cvation-intro-terraform-service-plan"
  type    = string
}

variable "webapp_name" {
  default = "cvation-intro-terraform-webapp"
  type    = string
}

variable "ARM_SUBSCRIPTION_ID" {
  default = "4028a679-3d4e-46de-8f25-c7687e0a8dce"
  type    = string
}

variable "ARM_CLIENT_ID" {
  default = "76c7099f-bd2a-47f4-8744-0a48f9b9a1fd"
  type    = string
}

variable "ARM_CLIENT_SECRET" {
  default   = "VTa8Q~IMnNxUUA9c4ti.IIE8X_ykvyW~qs4h3aE7"
  type      = string
  sensitive = true
}

variable "ARM_TENANT_ID" {
  default = "51f2b856-c214-467f-b811-ebe0e9c4092f"
  type    = string
}

# #Account 
# variable "storage_account_name" {
#   default = "cvation-intro-storage-account"
#   type    = string
# }
# variable "location" {
#   default = "westeurope"
#   type    = string
# }
# variable "account_tier" {
#   default = "Standard"
#   type    = string
# }
# variable "account_replication_type" {
#   default = "LRS"
#   type    = string
# }
# variable "tags" {
#   default = {
#     Environment = "Terraform Getting Started"
#     Team        = "DevOps"
#   }
#   type = map(string)
# }

# #Federated Identity Credentials
# variable "federated_identity_credential_name" {
#   default = "cvation-intro-terraform-federated-identity-credential"
#   type    = string
# }
# variable "user_assigned_identity_id" {
#   default = "cvation-intro-terraform-user-assigned-identity"
#   type    = string
# }
# variable "audience_name" {
#   default = "api://AzureADTolenExchange"
#   type    = string
# }
# variable "issuer_url" {
#   default = "https://token.actions.githubusercontent.com"
#   type    = string
# }
# variable "subject" {
#   default = "repo:cvation-intro-terraform:environment:production"
#   type    = string
# }
# variable "github_organization_target" {
#   default = "cVation"
#   type    = string
# }
# variable "github_repository" {
#   default = "cvation-intro-test-repo"
#   type    = string
# }
# variable "environment" {
#   default = "production"
#   type    = string
# }
