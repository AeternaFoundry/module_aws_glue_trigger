variable "glue_triggers" {
  description = <<EOT
Map of glue_triggers, attributes below
Required:
    - name
    - type
    - actions (block):
        - arguments (optional)
        - crawler_name (optional)
        - job_name (optional)
        - notification_property (optional, block):
            - notify_delay_after (optional)
        - security_configuration (optional)
        - timeout (optional)
Optional:
    - description
    - enabled
    - region
    - schedule
    - start_on_creation
    - tags
    - tags_all
    - workflow_name
    - event_batching_condition (block):
        - batch_size (required)
        - batch_window (optional)
    - predicate (block):
        - conditions (required, block):
            - crawl_state (optional)
            - crawler_name (optional)
            - job_name (optional)
            - logical_operator (optional)
            - state (optional)
        - logical (optional)
EOT

  type = map(object({
    name              = string
    type              = string
    description       = optional(string)
    enabled           = optional(bool)
    region            = optional(string)
    schedule          = optional(string)
    start_on_creation = optional(bool)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    workflow_name     = optional(string)
    actions = list(object({
      arguments    = optional(map(string))
      crawler_name = optional(string)
      job_name     = optional(string)
      notification_property = optional(object({
        notify_delay_after = optional(number)
      }))
      security_configuration = optional(string)
      timeout                = optional(number)
    }))
    event_batching_condition = optional(list(object({
      batch_size   = number
      batch_window = optional(number)
    })))
    predicate = optional(object({
      conditions = list(object({
        crawl_state      = optional(string)
        crawler_name     = optional(string)
        job_name         = optional(string)
        logical_operator = optional(string)
        state            = optional(string)
      }))
      logical = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_triggers : (
        length(v.actions) >= 1
      )
    ])
    error_message = "Each actions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_triggers : (
        v.predicate == null || (length(v.predicate.conditions) >= 1)
      )
    ])
    error_message = "Each conditions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_triggers : (
        v.event_batching_condition == null || alltrue([for item in v.event_batching_condition : (item.batch_size >= 1 && item.batch_size <= 100)])
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_triggers : (
        v.event_batching_condition == null || alltrue([for item in v.event_batching_condition : (item.batch_window == null || (item.batch_window >= 1 && item.batch_window <= 900))])
      )
    ])
    error_message = "must be between 1 and 900"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

