pipeline{
    agent{
<<<<<<< HEAD
        label ""
=======
      label ''
>>>>>>> 70afbd49afd049f80e3ed8913a6134ea6d224519
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
<<<<<<< HEAD

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
=======
>>>>>>> 70afbd49afd049f80e3ed8913a6134ea6d224519
    }
}
  

                
