#Provider
provider "aws" {
  region = "us-east-1"

}

variable "name" {
    default = ["LightFeather-Pipeline-Project"]
}

resource "aws_ecr_repository" "backend-ecr" {
  name   = "backend-app"
  force_delete = true
  
  tags = {
    Name = var.name[0]
  }
}


resource "aws_ecr_repository" "frontend-ecr" {
  name = "frontend-app"
  force_delete = true
  
  tags = {
    Name = var.name[0]
  
  }
}