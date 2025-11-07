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
* `metric_query` (list(object)) - A list of metric query objects that define the metrics or expressions used by the alarm. Each object supports the following attributes:
  * `id` (string) - A short name used to identify this metric within the alarm.
  * `expression` (string, optional) - The metric math expression to be evaluated for this query.
  * `label` (string, optional) - A human-readable label for this metric or expression.
  * `return_data` (bool, optional) - Indicates whether this query should be returned as part of the alarm state.
  * `period` (number, optional) - The period, in seconds, over which the specified statistic is applied.
  * `account_id` (string, optional) - The ID of the account where the metric is located (for cross-account queries).
  * `metric` (object, optional) - Defines a specific metric for this query. Supports the following attributes:
    * `namespace` (string) - The namespace of the metric (e.g., `AWS/EC2`).
    * `metric_name` (string) - The name of the metric (e.g., `CPUUtilization`).
    * `dimensions` (map(string), optional) - A map of dimensions that identify the metric.
    * `period` (number, optional) - The period, in seconds, over which the metric is evaluated.
    * `stat` (string, optional) - The statistic to apply to the metric (e.g., `Average`, `Sum`, `Maximum`).
    * `unit` (string, optional) - The unit for the metric.
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

## Testing

Manual testing:

```
# Replace "xxx" with an actual AWS profile, then execute the integration tests.
export AWS_PROFILE=xxx 
make terraform/pytest PYTEST_ARGS="-v --nomock"
```

For automated testing, PYTEST_ARGS is optional and no profile is needed:

```
make mockstack/up
make terraform/pytest PYTEST_ARGS="-v"
make mockstack/clean
```

<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metric_alarms"></a> [metric\_alarms](#input\_metric\_alarms) | Schema list containing the fields noted in the Variable Defintions sections | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metric_alarms"></a> [metric\_alarms](#output\_metric\_alarms) | Maps of name => metric\_alarm objects |

<!-- END TFDOCS -->
