variable "name" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "user_data" { type = string }
variable "app_http_port" { type = number }
variable "min_size" { type = number }
variable "max_size" { type = number }
variable "desired_capacity" { type = number }
