module "base" {
  source = "./modules/base"

  resource_group_name_prefix = var.resource_group_name_prefix
  resource_group_location    = var.resource_group_location

  # KeyVault secrets
  docker_username_keyvault_secret_value = var.docker_username_keyvault_secret_name
  docker_password_keyvault_secret_value = var.docker_password_keyvault_secret_name
  docker_email_keyvault_secret_value    = var.docker_email_keyvault_secret_name
}

module "cluster" {
  source = "./modules/aks"

  resource_group_name     = module.base.resource_group_name
}

module "kubernetes_config" {
  source = "./modules/kubernetes"

  master_namespace_name = var.namespace_name
  configmap_name        = var.configmap_name

  keyvault_id = module.base.keyvault_id
}
