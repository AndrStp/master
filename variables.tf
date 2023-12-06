variable "base_resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "eastus"
}

variable "base_resource_group_name_prefix" {
  description = "Prefix of the resource group name."
  type        = string
  default     = "rg"
}

variable "cluster_resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "eastus"
}

variable "cluster_resource_group_name_prefix" {
  description = "Prefix of the resource group name."
  type        = string
  default     = "k8s"
}

variable "namespace_name" {
  description = "Name of the namespace."
  type        = string
  default     = "master"
}

variable "configmap_name" {
  description = "Name of the ConfigMap."
  type        = string
  default     = "config"
}

variable "docker_username_keyvault_secret_name" {
  type        = string
  description = "The keyvault secret name of username for docker registry"
  default     = "docker-username"
}

variable "docker_username_keyvault_secret_value" {
  type        = string
  description = "The username (value) for docker registry."
  default     = null
}

variable "docker_password_keyvault_secret_name" {
  type        = string
  description = "The keyvault secret name of password for docker registry"
  default     = "docker-password"
}

variable "docker_password_keyvault_secret_value" {
  type        = string
  description = "The password (value) for docker registry."
  default     = null
}

variable "docker_email_keyvault_secret_name" {
  type        = string
  description = "The keyvault secret name of email for docker registry"
  default     = "docker-email"
}

variable "docker_email_keyvault_secret_value" {
  type        = string
  description = "The email (value) for docker registry."
  default     = null
}
