# LightFeather-DevOps-Coding-Challenge

Go to GitHub (github.com)
Login to your GitHub Account
Fork repository "devops-code-challenge ." (https://github.com/Team-LightFeather/devops-code-challenge.git) & name it "LightFeather-DevOps-Coding-Challenge"
Cloned your newly created repo to your local


Jenkins
Created an Amazon Linux 2 VM instance and call it "Jenkins-Project"
Instance type: t2.micro
Security Group (Open): 8080, 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
Attached Jenkins server with IAM role having "System Administrator"
User data (Copy the following user data): https://github.com/Saxontony/LightFeather-DevOps-Coding-Challenge/blob/Installations/Jenkins-git-terraform.sh
Launch Instance
Access to Jenkins - http://54.167.181.168:8080/
                    Username - admin
                    Password - admin
