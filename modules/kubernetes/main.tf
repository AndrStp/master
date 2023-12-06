resource "kubernetes_namespace_v1" "master" {
  metadata {
    annotations = {
      name = var.master_namespace_name
    }

    labels = {
      env = "master"
    }

    name = var.master_namespace_name
  }
}

resource "kubernetes_config_map_v1" "config" {
  metadata {
    name      = var.configmap_name
    namespace = kubernetes_namespace_v1.master.metadata[0].name

    labels = {
      env = "master"
    }
  }

  data = {
    NAME     = var.config_env_name
    LOCATION = var.config_env_location
  }
}

resource "kubernetes_secret_v1" "docker_cfg" {
  metadata {
    name = "docker-cfg"
    namespace = kubernetes_namespace_v1.master.metadata[0].name

    labels = {
      env = "master"
    }
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.docker_server}" = {
          "username" = data.azurerm_key_vault_secret.docker_username.value
          "password" = data.azurerm_key_vault_secret.docker_password.value
          "email"    = data.azurerm_key_vault_secret.docker_email.value
          "auth"     = base64encode("${data.azurerm_key_vault_secret.docker_username.value}:${data.azurerm_key_vault_secret.docker_password.value}")
        }
      }
    })
  }
}
