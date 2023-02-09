pipeline {
    agent any


    tools {
        nodejs 'nodejs'
        terraform 'terraform'
        jdk 'jdk'

        
    }

    stages {
        
        stage('Git checkout') {
            steps {
                echo 'Cloning the application code...'
                git branch: 'main', url: 'https://github.com/paradination/training.git'

            }
        }


        stage('Logging into AWS ECR') {
            steps {withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                script {
                    sh "aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin <insert aws account no>.dkr.ecr.us-east-1.amazonaws.com"
    
                
                    }
                }
            }
            
        }
        
        stage('Create ECR') {
            steps {withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                script {
                        echo 'ECR creation using terraform'
                        sh 'cd ecr-create-terraform && terraform init'
                        sh 'cd ecr-create-terraform && terraform apply -auto-approve'
                
                    }
                }


            
            }
        }


        
        
        stage('backend app image creation') {
          steps {
              
                  sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/backend && sudo docker build -t backend-app:latest .'
                  sh 'sudo docker tag backend-app:latest <insert aws account no>.dkr.ecr.us-east-1.amazonaws.com/backend-app:latest'

              
          }
            
            
        }

        stage('backend app push into ECR') {
            steps {
                withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'sudo docker push <insert aws account no>.dkr.ecr.us-east-1.amazonaws.com/backend-app:latest'
                }
                

                
            }
          
            
        }
        
        stage('frontend app image creation') {
          steps {
              
                  sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/frontend && sudo docker build -t frontend-app:latest .'
                  sh 'sudo docker tag frontend-app:latest <insert aws account no>.dkr.ecr.us-east-1.amazonaws.com/frontend-app:latest'

              
          }
            
            
        }

        stage('frontend app push into ECR') {
            steps {
                withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'sudo docker push <insert aws account no>.dkr.ecr.us-east-1.amazonaws.com/frontend-app:latest'
                }
                

                
            }
          
            
        }

        stage('Create ECS') {
            steps {withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                script {
                        echo 'create serverless ecs'
                        sh 'cd serverless-deploy-ecs && terraform init'
                        sh 'cd serverless-deploy-ecs && terraform apply -auto-approve'
                
                    }
                }


            
            }
        }



        stage('Backend and frontend service deploy on jenkins to be accessed publicly') {
            steps {
                echo 'we using docker compose to run both apps and link'
                sh 'sudo docker-compose stop $1'
                sh 'sudo docker-compose build $1'
                sh 'sudo docker-compose up -d $1'
                
                
                
                
            }

            
        }
 

        stage('backend Review/Access') {
            steps {
                sh "curl -i localhost:9101"
                
                
                
                
            }

            
        }
        

        stage('Frontend Review/Access') {
            steps {
                sh "curl -i localhost:9102"
                
                
                
                
            }

            
        }


        stage('Approval to destroy') {
            steps {
                script {
                    def deploymentDelay = input id: 'Deploy', message: 'want to destroy?', submitter: 'admin', parameters: [choice(choices: ['0', '1', '5', '10', '20', '30', '50', '100'], description: 'Hours to delay deployment?', name: 'DestroyDelay')]
                    sleep time: deploymentDelay.toInteger(), unit: 'MINUTES'
                }
            }
        }

    
        stage('Destroy AWS INFRA') {
            steps {withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                script {
                        echo 'destroying ecr and ecs'
                        sh 'cd serverless-deploy-ecs && terraform destroy -auto-approve'
                        sh 'cd ecr-create-terraform && terraform destroy -auto-approve'
                        sh 'sudo docker-compose down $1'
                    }
                }

       
            }
        }
        


    }

}
