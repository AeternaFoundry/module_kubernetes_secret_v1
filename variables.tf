variable "secret_v1s" {
  description = <<EOT
Map of secret_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
Optional:
    - binary_data
    - binary_data_wo
    - binary_data_wo_revision
    - data
    - data_wo
    - data_wo_revision
    - immutable
    - type
    - wait_for_service_account_token
    - timeouts (block):
        - create (optional)
EOT

  type = map(object({
    binary_data                    = optional(map(string))
    binary_data_wo                 = optional(map(string))
    binary_data_wo_revision        = optional(number)
    data                           = optional(map(string))
    data_wo                        = optional(map(string))
    data_wo_revision               = optional(number)
    immutable                      = optional(bool)
    type                           = optional(string)
    wait_for_service_account_token = optional(bool)
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    timeouts = optional(object({
      create = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.secret_v1s : (
        v.data_wo_revision == null || (v.data_wo_revision >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.secret_v1s : (
        v.binary_data_wo_revision == null || (v.binary_data_wo_revision >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
}

