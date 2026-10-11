output "secret_v1s_id" {
  description = "Map of id values across all secret_v1s, keyed the same as var.secret_v1s except keys with no id are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.id if v.id != null && length(v.id) > 0 }
}
output "secret_v1s_binary_data" {
  description = "Map of binary_data values across all secret_v1s, keyed the same as var.secret_v1s except keys with no binary_data are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.binary_data if v.binary_data != null && length(v.binary_data) > 0 }
  sensitive   = true
}
output "secret_v1s_binary_data_wo_revision" {
  description = "Map of binary_data_wo_revision values across all secret_v1s, keyed the same as var.secret_v1s except keys with no binary_data_wo_revision are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.binary_data_wo_revision if v.binary_data_wo_revision != null }
}
output "secret_v1s_data" {
  description = "Map of data values across all secret_v1s, keyed the same as var.secret_v1s except keys with no data are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.data if v.data != null && length(v.data) > 0 }
  sensitive   = true
}
output "secret_v1s_data_wo_revision" {
  description = "Map of data_wo_revision values across all secret_v1s, keyed the same as var.secret_v1s except keys with no data_wo_revision are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.data_wo_revision if v.data_wo_revision != null }
}
output "secret_v1s_immutable" {
  description = "Map of immutable values across all secret_v1s, keyed the same as var.secret_v1s except keys with no immutable are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.immutable if v.immutable != null }
}
output "secret_v1s_metadata" {
  description = "Map of metadata values across all secret_v1s, keyed the same as var.secret_v1s except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "secret_v1s_type" {
  description = "Map of type values across all secret_v1s, keyed the same as var.secret_v1s except keys with no type are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.type if v.type != null && length(v.type) > 0 }
}
output "secret_v1s_wait_for_service_account_token" {
  description = "Map of wait_for_service_account_token values across all secret_v1s, keyed the same as var.secret_v1s except keys with no wait_for_service_account_token are omitted"
  value       = { for k, v in kubernetes_secret_v1.secret_v1s : k => v.wait_for_service_account_token if v.wait_for_service_account_token != null }
}

