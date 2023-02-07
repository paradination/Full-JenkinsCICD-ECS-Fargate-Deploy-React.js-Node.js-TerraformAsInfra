pipeline {
    agent any


    tools {
        nodejs 'nodejs'
        
    }

    stages {
        
        stage('Git checkout') {
            steps {
                echo 'Cloning the application code...'
                git branch: 'main', url: 'https://github.com/paradination/training.git'

            }
        }

        stage('Installation check') {
            steps {
                
                sh 'npm version'
            
                
            }

            
        }
        
        // stage('connect to ECR') {
        //     steps {
        //       withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        //             sh 'aws ecr get-login --region us-east-1 --no-include-email'
        //         }
                

        //     }
        // }
        
        stage('Logging into AWS ECR') {
            steps {withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                script {
                    sh "aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 204778724427.dkr.ecr.us-east-1.amazonaws.com"
    
                
                    }
                }
            }
            
        }
        
        
        // stage('backend app image creation') {
        //   steps {
              
        //           sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/backend && sudo docker build -t backend-app:latest .'
        //           sh 'sudo docker tag backend-app:latest 204778724427.dkr.ecr.us-east-1.amazonaws.com/backend-app:latest'

              
        //   }
            
            
        // }

        // stage('backend app push into ECR') {
        //     steps {
        //         withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        //             sh 'sudo docker push 204778724427.dkr.ecr.us-east-1.amazonaws.com/backend-app:latest'
        //         }
                

                
        //     }
          
            
        // }
        
        stage('frontend app image creation') {
          steps {
              
                  sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/frontend && sudo docker build -t frontend-app:latest .'
                  sh 'sudo docker tag frontend-app:latest 204778724427.dkr.ecr.us-east-1.amazonaws.com/frontend-app:latest'

              
          }
            
            
        }

        stage('frontend app push into ECR') {
            steps {
                withCredentials([aws(credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'sudo docker push 204778724427.dkr.ecr.us-east-1.amazonaws.com/frontend-app:latest'
                }
                

                
            }
          
            
        }



   
        
        
        // stage('Frontend Install') {
        //     steps {
        //         sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/frontend && npm install'
                
                
                
        //     }

            
        // }
        
            
        // stage('Backend Install') {
        //     steps {
        //         sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/backend && npm install'
                
                
                
        //     }
            

        // }
        


            
        // }

        
        stage('Backend Review') {
            steps {
                sh "curl -i localhost:9101"
                
                
                
                
            }

            
        }
        

        stage('Frontend Review') {
            steps {
                sh "curl -i localhost:9102"
                
                
                
                
            }

            
        }
       
    }
}
