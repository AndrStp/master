output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "keyvault_name" {
  value = azurerm_key_vault.this.name
}

output "keyvault_id" {
  value = azurerm_key_vault.this.id
}
