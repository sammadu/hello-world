data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/*22.04*"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
  
}

#Provision to ap-south-1 region

provider "aws" {

    region = "ap-south-1"
  
}

resource "aws_instance" "app_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
    key_name = "app-ssh-key"

    
  
}

