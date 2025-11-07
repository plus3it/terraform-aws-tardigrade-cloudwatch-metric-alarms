locals {
  metric_alarms = [
    {
      alarm_name                = "terraform-metric-alarm-test"
      comparison_operator       = "GreaterThanOrEqualToThreshold"
      evaluation_periods        = "2"
      metric_name               = "CPUUtilization"
      namespace                 = "AWS/EC2"
      period                    = "120"
      statistic                 = "Average"
      threshold                 = "80"
      alarm_description         = "This metric monitors ec2 cpu utilization"
      insufficient_data_actions = []

      metric_query = [
        {
          id          = "m1"
          return_data = true

          metric = {
            namespace   = "AWS/EC2"
            metric_name = "CPUUtilization"
            dimensions = {
              InstanceId = "i-0123456789abcdef0"
            }
            period = 300
            stat   = "Average"
          }
        }
      ]
    }
  ]
}

module "create_metric_alarm" {
  source = "../../"

  metric_alarms = local.metric_alarms
}
