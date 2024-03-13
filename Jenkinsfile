pipeline {
  agent any
  stages {
    stage ('Docker Build') {
      steps {
        echo "var: ${var}"
        echo "\n================================================================================================================\n"
        // git 'https://github.com/hahan1401/nextjs.git'
        sh """
          ssh hahan@172.31.53.108 -p 2022 /bin/bash -ex <<'ENDSSH'
            docker compose -f docker-compose.yml build
            docker compose -f docker-compose.yml up -d

            exit
        """
        // docker compose -f docker-compose.yml build
        // docker compose -f docker-compose.yml up -d
      }
    }
  }
}