variable "name" {
  type = string
}

variable "alb_http_port" {
  type    = number
  default = 80
}

variable "app_http_port" {
  type = number
}

variable "app_health_check_path" {
  type    = string
  default = "/"
}
