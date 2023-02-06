pipeline {
    agent any


    tools {
        nodejs 'nodejs'
        jdk 'jdk'
        
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
        
        // stage('Backend Image') {
        //     steps {
        //         sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/backend && sudo docker build .'
        //         sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/backend && sudo docker images' 
                
                
                
        //     }
        // }

        // stage('Frontend Image') {
        //     steps {
        //         sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/frontend && sudo docker build .'
        //         sh 'cd /var/lib/jenkins/workspace/LightFeather-Pipeline-Project/frontend && sudo docker images' 
                
                
                
        //     }

        // }


        
        stage('Backend Deploy') {
            steps {
                sh "sudo docker run -dt -p 9091:8080 --name=backend1 1c9df926733b"
                
    
                
            }
        }

        stage('frontend Deploy') {
            steps {
                sh "sudo docker run -dt -p 9092:3000 --name=Frontend1 cb900744a640"
                
                
              
                
            }

            
        }
        
        stage('Backend Review') {
            steps {
                sh "curl -i localhost:9091"
                
                
                
                
            }

            
        }

        
        stage('Frontend Review') {
            steps {
                sh "curl -i localhost:9092"
                
                
                
                
            }

            
        }
       
    }

        
        
}