resource "aws_launch_template" "this" {
  name_prefix   = var.name
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = var.user_data

  network_interfaces {
    associate_public_ip_address = true
  }
}

resource "aws_autoscaling_group" "this" {
  name             = var.name
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  vpc_zone_identifier = []
}
