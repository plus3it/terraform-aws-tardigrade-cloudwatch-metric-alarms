provider "aws" {
  region = "us-east-1"
}

module "no_metric_alarm" {
  source              = "../../"
  create_metric_alarm = false
}
