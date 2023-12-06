variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group."
  default     = "k8s"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "eastus"
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 2
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}
