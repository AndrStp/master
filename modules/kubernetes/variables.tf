variable "keyvault_id" {
  description = "ID of the KeyVault."
  type        = string
  default     = null
}

variable "master_namespace_name" {
  description = "Name of the namespace."
  type        = string
  default     = "master"
}

variable "configmap_name" {
  description = "Name of the ConfigMap."
  type        = string
  default     = "config"
}

variable "config_env_name" {
  description = "Key `NAME` value for configmap. Defaults to `test`"
  type        = string
  default     = "test"
}

variable "config_env_location" {
  description = "Key `LOCATION` value for configmap. Defaults to `testland`"
  type        = string
  default     = "testland"
}

variable "docker_server" {
  description = "THe docker registry address"
  type        = string
  default     = "https://index.docker.io/v1"
}

variable "docker_username_keyvault_secret_name" {
  description = "The keyvault secret name of username for docker registry"
  type        = string
  default     = "docker-username"
}

variable "docker_password_keyvault_secret_name" {
  description = "The keyvault secret name of password for docker registry"
  type        = string
  default     = "docker-password"
}

variable "docker_email_keyvault_secret_name" {
  description = "The keyvault secret name of email for docker registry"
  type        = string
  default     = "docker-email"
}
