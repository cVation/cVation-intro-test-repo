variable "resource_group_name" {
  default = "cvation-intro-terraform-resource-group"
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