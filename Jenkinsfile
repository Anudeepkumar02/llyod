pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/Anudeepkumar02/llyod.git'
            }
        }
        stage('Hello') {
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
                    sh  'docker build -t llyod .'
                }
            }
        }
        stage('Push docker images to dockerhub') {
            steps {
                script{
                    sh 'docker tag lloyd 2222s/llyod:l.0 '
                    sh 'dokcer push 2222s/lloyd:1.0'
                }
            }
        }
    }
}
