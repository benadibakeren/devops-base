data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

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

  vpc_zone_identifier = data.aws_subnets.default.ids

}
