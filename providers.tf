terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.83.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.23.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~>1.10.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

provider "random" {}

provider "kubernetes" {
  host                   = module.cluster.host
  client_certificate     = base64decode(module.cluster.client_certificate)
  client_key             = base64decode(module.cluster.client_key)
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
}

provider "azapi" {}
