pipeline{
    agent{
        label ''
    }
    tools {
        jdk 'Java17'
        maven 'Maven3'
    }

    environment {
        APP_NAME = "javaapp"
        DOCKER_USERNAME = "rahulsantosh13"
        DOCKER_PASS = "dockerpass"
        RELEASE = "1.0.0"
        IMAGE_NAME = "${DOCKER_USERNAME}/${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"

    }
    
    stages{
        stage("cleaning workspace"){
            steps{
                cleanWs()
            }
        }
        stage("from scm"){
            steps{
                git branch: 'main', url: 'https://github.com/rahul-santosh7/Java-pipeline', credentialsId: 'github'
            }

        }

        stage("building java package"){
            steps{
                sh "mvn package"
            }
        }

        stage("test package"){
            steps{
                sh "mvn test"
            }
        }

        stage("Building docker image"){
            steps{
                script {
                    
                    docker.withRegistry('',DOCKER_PASS)
                    {
                        docker_image= docker.build "${IMAGE_NAME}" .
                    }

                    docker.withRegistry('',DOCKER_PASS)
                    {
                        docker_image.push("${IMAGE_TAG}")
                    }
                }
            }
        }
    }
}
  

                
