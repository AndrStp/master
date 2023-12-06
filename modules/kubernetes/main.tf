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

resource "kubernetes_service_account_v1" "master" {
  metadata {
    name      = var.master_namespace_name
    namespace = var.master_namespace_name

    labels = {
      env = "master"
    }
  }
  image_pull_secret {
    name = "docker-cfg"
  }
}

resource "kubernetes_cluster_role_v1" "master" {
  metadata {
    name = var.master_namespace_name

    labels = {
      env = "master"
    }
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "master" {
  metadata {
    name = var.master_namespace_name

    labels = {
      "app.kubernetes.io/managed-by" = "Terraform"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = var.master_namespace_name
  }
  subject {
    kind      = "ServiceAccount"
    name      = var.master_namespace_name
    namespace = var.master_namespace_name
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
