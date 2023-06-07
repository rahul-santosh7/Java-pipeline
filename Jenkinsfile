pipeline{
    agent{
        label ''
    }
    tools {
        jdk 'Java17'
        maven 'Maven3'
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
    }
}
  

                
