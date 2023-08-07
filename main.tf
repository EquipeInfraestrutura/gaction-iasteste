terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "eu-east-2"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"


  name = "single-instance"


  ami                    = "ami-0f08721e5f546d256"
  instance_type          = "t3a.micro"
  key_name               = "Key_Keycloak"
  monitoring             = true
  vpc_security_group_ids = ["sg-0f6a68253d49d98ae"]
  subnet_id              = "subnet-0611591f91df44592"


  tags = {
    Name = "RHSSO_Gactions"
  }
}
