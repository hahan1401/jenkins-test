pipeline {
  agent any
  stages {
    stage ('Docker Build') {
      steps {
        echo "var: ${var}"
        echo "\n================================================================================================================\n"
        // git 'https://github.com/hahan1401/nextjs.git'
       sh """
          sshpass -p 'hahan' ssh -p 2022 hahan@172.31.53.108 /bin/bash - <<'ENDSSH'
            docker-compose -f docker-compose.yml build
            docker-compose -f docker-compose.yml up -d
          ENDSSH
            exit
        """
        // docker compose -f docker-compose.yml build
        // docker compose -f docker-compose.yml up -d
      }
    }
  }
}