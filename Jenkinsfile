pipeline {
  agent any
  stages {
    stage ('Docker Build') {
      steps {
        echo "var: ${var}"
        echo "\n================================================================================================================\n"
        // git 'https://github.com/hahan1401/nextjs.git'
        docker compose -f docker-compose.yml build
        docker compose -f docker-compose.yml up -d
      }
    }
  }
}