# Sample application for e2e DevOps Pipeline
## This is a sample application to demonstrate an end to end DevOps Pipeline


The important thing here for the project is: 
  1) Adding right Maven and Java plugins,for java better download java from oracle.
  2) Integrate Git hub to the project using the pat token and repo link


Defining jenkins file
---------------------

pipeline
{
agent any{
}
tools
{
jdk 'Java 17'
maven 'Maven 3'
}
stages
{
  stage("clean workspace")
    {
    steps{
        CleanWs()
         }
   stage ("git")
      {
       steps {
           git branch : 'main', credential id : 'github' , url : "https://github.com/rahul-santosh7/Java-pipeline/tree/main
           }
        }
   stage (" Building using maven")
        {
          steps {
              sh "mvn clean package"
                }
         }
  stage ("testing the application")
         {
           steps {
              sh "mvn test"
              }
          }
}
}
