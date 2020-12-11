locals {
  metric_alarms = { for alarm in var.metric_alarms : alarm.alarm_name => alarm }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = local.metric_alarms

  # alarm information
  alarm_name        = each.key
  alarm_description = lookup(each.value, "alarm_description", null)
  actions_enabled   = lookup(each.value, "actions_enabled", true)

  # actions to take when the alarm enters the designated state
  alarm_actions             = lookup(each.value, "alarm_actions", null)
  ok_actions                = lookup(each.value, "ok_actions", null)
  insufficient_data_actions = lookup(each.value, "insufficient_data_actions", null)

  # metric information
  metric_name        = lookup(each.value, "metric_name", null)
  namespace          = lookup(each.value, "namespace", null)
  dimensions         = lookup(each.value, "dimensions", null)
  period             = lookup(each.value, "period", null)
  statistic          = lookup(each.value, "statistic", null)
  extended_statistic = lookup(each.value, "extended_statistic", null)

  # metric evaluation
  comparison_operator = lookup(each.value, "comparison_operator", null)
  evaluation_periods  = lookup(each.value, "evaluation_periods", 0)
  threshold           = lookup(each.value, "threshold", 0)
  unit                = lookup(each.value, "unit", null)

  datapoints_to_alarm                   = lookup(each.value, "datapoints_to_alarm", null)
  treat_missing_data                    = lookup(each.value, "treat_missing_data", "missing")
  evaluate_low_sample_count_percentiles = lookup(each.value, "evaluate_low_sample_count_percentiles", null)

  tags = lookup(each.value, "tags", {})
}
