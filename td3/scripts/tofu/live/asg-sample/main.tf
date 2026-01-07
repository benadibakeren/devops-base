module "asg" {
  source = "git::https://github.com/benadibakeren/devops-base.git//td3/tofu/modules/asg"

  name              = "sample-app-asg"
  ami_id            = "ami-0c960c064f6b4c8fb"
  user_data         = filebase64("${path.module}/user-data.sh")
  app_http_port     = 8080

  instance_type     = "t2.micro"
  min_size          = 1
  max_size          = 10
  desired_capacity  = 3
}
