output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}

output "service_plan_id" {
  value = azurerm_service_plan.sp.id
}

output "webapp_id" {
  value = azurerm_linux_web_app.webapp.id
}