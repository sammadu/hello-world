data "aws_ami" "amazon" {

    most_recent = true

    filter {
      name = "name"
      values = ["ami-02a2af70a66af6dfb"]
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
    ami = data.aws_ami.amazon.id
    instance_type = "t3.micro"
    key_name = "app-ssh-key"

    
  
}

