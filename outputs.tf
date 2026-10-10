output "glue_triggers_id" {
  description = "Map of id values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_triggers_actions" {
  description = "Map of actions values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.actions if v.actions != null && length(v.actions) > 0 }
}
output "glue_triggers_arn" {
  description = "Map of arn values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "glue_triggers_description" {
  description = "Map of description values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "glue_triggers_enabled" {
  description = "Map of enabled values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.enabled if v.enabled != null }
}
output "glue_triggers_event_batching_condition" {
  description = "Map of event_batching_condition values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.event_batching_condition if v.event_batching_condition != null && length(v.event_batching_condition) > 0 }
}
output "glue_triggers_name" {
  description = "Map of name values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_triggers_predicate" {
  description = "Map of predicate values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => one(v.predicate) if v.predicate != null && length(v.predicate) > 0 }
}
output "glue_triggers_region" {
  description = "Map of region values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_triggers_schedule" {
  description = "Map of schedule values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.schedule if v.schedule != null && length(v.schedule) > 0 }
}
output "glue_triggers_start_on_creation" {
  description = "Map of start_on_creation values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.start_on_creation if v.start_on_creation != null }
}
output "glue_triggers_state" {
  description = "Map of state values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.state if v.state != null && length(v.state) > 0 }
}
output "glue_triggers_tags" {
  description = "Map of tags values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "glue_triggers_tags_all" {
  description = "Map of tags_all values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "glue_triggers_type" {
  description = "Map of type values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.type if v.type != null && length(v.type) > 0 }
}
output "glue_triggers_workflow_name" {
  description = "Map of workflow_name values across all glue_triggers, keyed the same as var.glue_triggers"
  value       = { for k, v in aws_glue_trigger.glue_triggers : k => v.workflow_name if v.workflow_name != null && length(v.workflow_name) > 0 }
}

