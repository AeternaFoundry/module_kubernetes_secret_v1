resource "kubernetes_secret_v1" "secret_v1s" {
  for_each = var.secret_v1s

  binary_data                    = each.value.binary_data
  binary_data_wo                 = each.value.binary_data_wo
  binary_data_wo_revision        = each.value.binary_data_wo_revision
  data                           = each.value.data
  data_wo                        = each.value.data_wo
  data_wo_revision               = each.value.data_wo_revision
  immutable                      = each.value.immutable
  type                           = each.value.type
  wait_for_service_account_token = each.value.wait_for_service_account_token

  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
    }
  }
}

