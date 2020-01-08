provider "aws" {
  region = "us-east-1"
}

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
    }
  ]
}

module "create_metric_alarm" {
  source = "../../"

  create_metric_alarm = true
  metric_alarms       = local.metric_alarms
}
