pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/Anudeepkumar02/llyod.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Artifact download') {
            steps {
                sh 'aws s3 cp target/*.war s3://warfileswebproject/lloyd/lloyd.war'
                sh 'aws s3 cp target/*.war s3://warfileswebproject/lloyd/lloyd$BUILD_NUMBER.war'
            }
        }
        stage('Build docker images') {
            steps {
                script{
                    sh  'docker build -t llyod-$BUILD_NUMBER .'
                }
            }
        }
        stage('Push docker images to dockerhub') {
            steps {
                script{
                    sh 'docker tag lloyd 2222s/llyod-$BUILD_NUMBER:latest'
                    sh 'dokcer push 2222s/llyod-$BUILD_NUMBER:latest'
                }
            }
        }
    }
}
