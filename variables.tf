variable "create_metric_alarm" {
  description = "Controls whether to create the CloudWatch metric alarm(s)"
  type        = bool
  default     = true
}

variable "metric_alarms" {
  description = "Schema list containing the fields noted in the Variable Defintions sections"
  type        = list
  default     = []
}
