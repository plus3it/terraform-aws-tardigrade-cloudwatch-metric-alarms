variable "metric_alarms" {
  description = "Schema list containing the fields noted in the Variable Defintions sections"
  type        = list(any)
  default     = []

  validation {
    condition = alltrue([
      for alarm in var.metric_alarms : (
        (
          lookup(alarm, "metric_query", null) != null && lookup(alarm, "metric_name", null) == null
          ) || (
          lookup(alarm, "metric_query", null) == null && lookup(alarm, "metric_name", null) != null
        )
      )
    ])
    error_message = "Each alarm must specify either 'metric_query' or 'metric_name', but not both or neither."
  }
}
