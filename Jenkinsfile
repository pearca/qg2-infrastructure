pipeline {
    agent any
    environment {
        ECR_NAMESPACE ='585307327397.dkr.ecr.ca-central-1.amazonaws.com'
    }   
    stages {
        stage('Build AWS-CLI Image') {
            steps {
                script {
                    app = docker.build(env.ECR_NAMESPACE + '/q-deployment-support/awscli', 'aws-cli')
                    //app.push("1.0")
                }    
            }
        }      
        stage('Build Products-Provider Image') {
            steps {
                script {
                    app = docker.build(env.ECR_NAMESPACE + '/qscoring/product-provider', 'products-provider')
                    //app.push('latest')
                }    
            }
        }          
        stage('Build Credentials-Provider Image') {
            steps {
                script {
                    app = docker.build(env.ECR_NAMESPACE + '/qglobal/credential-provider', 'credentials-provider')
                    //app.push('latest')
                }    
            }
        }        
    }
}