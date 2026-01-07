module "asg" {
  source = "git::https://github.com/benadibakeren/devops-base.git//td3/scripts/tofu/modules/asg"

  name              = "sample-app-asg"
  ami_id            = "ami-0c960c064f6b4c8fb"
  instance_type     = "t2.micro"
  user_data         = filebase64("${path.module}/user-data.sh")
  app_http_port     = 8080
  min_size          = 1
  max_size          = 3
  desired_capacity  = 1
}
