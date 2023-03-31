terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0735c191cf914754d"
  instance_type = "t2.micro"
  key_name      = "iac-alura"
  # user_data     = <<-EOF
  #                     #!/bin/bash
  #                     cd /home/ubuntu
  #                     echo "<h1>Criado com Terraform</h1>" > index.html
  #                     nohup busybox httpd -f -p 8080 &
  #                     EOF
  #user_data_replace_on_change = true
  tags = {
    Name = "Terraform Ansible Python"
  }
}
