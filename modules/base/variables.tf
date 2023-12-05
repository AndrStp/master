variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "polandcentral"
}

variable "resource_group_name_prefix" {
  description = "Prefix of the resource group name."
  type        = string
  default     = "rg"
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = null
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = null
}

variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Set"]
}

variable "key_type" {
  description = "The JsonWebKeyType of the key to be created."
  default     = "RSA"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of the following: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_ops" {
  type        = list(string)
  description = "The permitted JSON web key operations of the key to be created."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "key_size" {
  type        = number
  description = "The size in bits of the key to be created."
  default     = 2048
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. If this value isn't null (the default), 'data.azurerm_client_config.current.object_id' will be set to this value."
  default     = null
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