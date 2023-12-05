output "namespace_name" {
  value = kubernetes_namespace_v1.master.metadata[0].name
}

