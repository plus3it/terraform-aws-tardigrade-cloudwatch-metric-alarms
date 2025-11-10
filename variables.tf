variable "metric_alarms" {
  description = "Schema list containing the fields noted in the Variable Defintions sections"
  type        = list(any)
  default     = []

  validation {
    condition = alltrue([
      for alarm in var.metric_alarms : anytrue([
        (alarm.metric_query != null && alarm.metric_name == null),
        (alarm.metric_query == null && alarm.metric_name != null),
      ])
    ])
    error_message = "Each alarm must specify either 'metric_query' or 'metric_name', but not both or neither."
  }
}
