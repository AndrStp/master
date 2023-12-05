# Base outputs
output "resource_group_name" {
  value = module.base.resource_group_name
}

output "resource_group_location" {
  value = module.base.resource_group_location
}

output "keyvault_name" {
  value = module.base.keyvault_name
}

output "keyvault_id" {
  value = module.base.keyvault_id
}

# AKS outputs
output "kubernetes_cluster_name" {
  value = module.cluster.kubernetes_cluster_name
}

output "cluster_password" {
  value     = module.cluster.cluster_password
  sensitive = true
}

output "cluster_username" {
  value     = module.cluster.cluster_username
  sensitive = true
}

output "host" {
  value     = module.cluster.host
  sensitive = true
}

output "kube_config" {
  value     = module.cluster.kube_config
  sensitive = true
}

# Kubernetes-config outputs
output "namespace_name" {
  value = module.kubernetes_config.namespace_name
}
