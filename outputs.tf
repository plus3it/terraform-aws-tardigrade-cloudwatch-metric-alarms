output "metric_alarms" {
  description = "Maps of name => metric_alarm objects"
  value       = aws_cloudwatch_metric_alarm.this
}
