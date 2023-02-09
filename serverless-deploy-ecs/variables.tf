#for VPC and Subnets

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-1"
}

variable "cidr" {
    default = "172.16.0.0/24"
}

variable "dns-hostname" {
    type = list
    default = [true, false]
}
variable "dns-support" {
    type = list
    default = [true, false]
}

#will create any number of subnets. We creating 1public and 1 private
variable "subnetcidr" {
    type = list
    default = ["172.16.0.0/26","172.16.0.64/26"]
}

variable "name" {
    default = ["LightFeather-Pipeline-Project"]
}

#creating opening 2 ports for public access of backend app (8080) and frontend app (3000)
variable "port-sg" {
    type = list 
    default = ["3000", "8080"]
}



#ECR image 

variable "ecr-uri-backend" {
    default = "204778724427.dkr.ecr.us-east-1.amazonaws.com/backend-app:latest"
}

variable "ecr-uri-frontend" {
    default = "204778724427.dkr.ecr.us-east-1.amazonaws.com/frontend-app:latest"
}



#task definition variables
variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

#Service number of task to run
variable "app_count" {
  description = "Number of docker task to run"
  default     = 1
}