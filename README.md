# DevOps-Coding-Challenge
# CICD with jenkins and terraform for the infra

STEPS:

Jenkins
Created an Amazon Linux 2 VM instance and call it "Jenkins-Project"
Instance type: t2.micro
Security Group (Open): 8080, 8081, 3000 TO 0.0.0.0/0
Key pair: Select or create a new keypair
Attached Jenkins server with IAM role having "System Administrator"
User data (Copy the following user data): https://github.com/paradination/training/blob/main/installations.sh

Launch Instance
CONFIGURATION FILE EDITS:
Made a change in the config files to allow public access of both App 

bankend/config.js


changed the IP to public IP

JENKINS CICD STEPS FOR PROJECT:
a) Add plugins
b) Add AWS credentials needed
c) Steps
    1)
    2)
    3)



RUNNING THE PROJECT:

Using docker container in same jenkins server and all contains the commands to run 

file for backend: 
file for frontend: 
Service: docker-compose service through "docker-compose.yml" file




TERRAFORM for INFRA:






PROJECT REQUIREMENTS 

1) Deploy a Jenkins server to AWS, and make it publicly accessible over the internet:
SOLUTION: 
            Access to Jenkins - http://18.232.174.113:8080/
                                Username - admin
                                Password - admin
2) Deploy the frontend and backend to AWS, and make the frontend publicly accessible over the internet.
SOLUTION:

            Access to frontend app over the internet = http://18.232.174.113:3000/

3) The deployment of the frontend and backend services must be automated in a Jenkins pipeline.
SOLUTION:
            Deployment was done in Jenkins pipeline using docker containers
            Jenkins Stage:
            Service: docker-compose service through "docker-compose.yml" file
            Internet access ports: 8081 for backend app
                                   3000 for frontend app

4) The frontend and backend applications must be deployed as containers using AWS ECS.
SOLUTION:

            Deployed in ECS service:
            Jenkins Stages: 

5) All infrastructure required to run the frontend and backend applications must be provisioned by Terraform. This should include the ECS cluster, services, and tasks for the backend and frontend applications.
SOLUTION:   

            Insfrastrure: for all deployment is done terraform
            ECR Creation: Terraform folder = ecr-create-terraform
            Serverless ECS creation: Terraform folder = serveless-deploy-ecs

