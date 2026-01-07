packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.0.0"
    }
  }
}

source "amazon-ebs" "sample_app" {
  region                  = "us-east-2"
  instance_type           = "t3.micro"
  ssh_username            = "ec2-user"
  ami_name                = "sample-app-ami-{{timestamp}}"

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    owners      = ["amazon"]
    most_recent = true
  }
}

build {
  sources = ["source.amazon-ebs.sample_app"]

  provisioner "shell" {
    inline = [
      "curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash",
      "bash -lc 'source ~/.bashrc && nvm install 16'",
      "bash -lc 'source ~/.bashrc && nvm use 16'",
      "bash -lc 'node -v'",
      "bash -lc 'npm install -g pm2'",
      "bash -lc 'pm2 -v'",
      "echo \"AMI built with Node.js via NVM\""
    ]
  }
}
