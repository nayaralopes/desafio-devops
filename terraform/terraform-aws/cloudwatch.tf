resource "aws_cloudwatch_metric_alarm" "cpu_usage" {
  alarm_name                = "cpu_usage"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 10
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []

  tags = {
    Terraform   = var.terraform
    Environment = var.environment
    Project     = var.project_name
  }
}