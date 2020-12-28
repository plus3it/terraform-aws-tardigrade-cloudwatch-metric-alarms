# terraform-aws-tardigrade-cloudwatch-metric-alarms

Terraform module to create CloudWatch Metric Alarms

# Variable Definitions

Among the input variables, there is a schema list `metric_alarms` which take the following fields:
* `alarm_name` (string) - The descriptive name for the alarm. This name must be unique within the user's AWS account.
* `alarm_description` (string) - The description for the alarm.
* `comparison_operator` (string) - The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold.
* `evaluation_periods` (number) - The number of periods over which data is compared to the specified threshold.
* `threshold` (number) - The value against which the specified statistic is compared.
* `unit` (string) - The unit for the alarm's associated metric.
* `metric_name` (string) - The name for the alarm's associated metric. See docs for supported metrics.
* `namespace` (string) - The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics.
* `period` (string) - The period in seconds over which the specified statistic is applied
* `statistic` (string) - The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum
* `actions_enabled` (bool) - Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true.
* `datapoints_to_alarm` (number) -  The number of datapoints that must be breaching to trigger the alarm.
* `dimensions` (map) - The dimensions for the alarm's associated metric.
* `alarm_actions` (list(string)) - The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN).
* `insufficient_data_actions` (list(string)) - The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN).
* `ok_actions` (list(string)) - The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN).
* `extended_statistic` (string) - The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100.
* `treat_missing_data` (string) - Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching.
* `evaluate_low_sample_count_percentiles` (string) - Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate.
* `tags` (map(string)) - A mapping of tags to assign to all resources


<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| metric\_alarms | Schema list containing the fields noted in the Variable Defintions sections | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| metric\_alarms | Maps of name => metric\_alarm objects |

<!-- END TFDOCS -->
