data "azurerm_key_vault_secret" "docker_username" {
  name         = var.docker_username_keyvault_secret_name
  key_vault_id = var.keyvault_id
}

data "azurerm_key_vault_secret" "docker_password" {
  name         = var.docker_password_keyvault_secret_name
  key_vault_id = var.keyvault_id
}

data "azurerm_key_vault_secret" "docker_email" {
  name         = var.docker_email_keyvault_secret_name
  key_vault_id = var.keyvault_id
}
