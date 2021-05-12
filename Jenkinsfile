pipeline {
  agent any

  environment {
    REGISTRY = '003235076673.dkr.ecr.us-west-2.amazonaws.com'
    REGION = 'us-west-2'
    ECR_REPOSITORY = 'test-ecr1'
    VERSION = 'latest'
    CREDENTIALS = 'AWS_CREDENTIALS'
    DOCKERFILE_PATH = './app/'
  }


  stages {
    stage('Git cloning'){
      steps {
        git branch: 'master',
            credentialsId: 'github',
            url: 'https://github.com/BiggyZable/Pipeline-task'
      }
    }

    stage('Build image and push') {
      steps {
        script {
            docker.build("${ECR_REPOSITORY}", "${DOCKERFILE_PATH}")
            docker.withRegistry("https://${REGISTRY}", "ecr:${REGION}:${CREDENTIALS}") { 
            docker.image("${ECR_REPOSITORY}").push("${VERSION}") 
          }
        }
      }
    }
  }

  post {
    success {
      sh "echo Successfully created infrastructure, builded docker image and pushed it to the ${ECR_REPOSITORY} ECR!" 
    }
    failure {
      sh "echo Failure!"
    }
  }
}