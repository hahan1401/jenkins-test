node {
  WORKSPACE=/home/user/project
  DEPLOYMENT_USER=deploy
  DEPLOYMENT_SERVER=example.com
  DEPLOYMENT_APP_PATH=/var/www/html/myapp

  try {

    stage ('PreBuild') {
    }
    
    stage ("Build") {
      sh """
      rsync -az --delete --rsync-path="mkdir -p /file-1 && rsync" --exclude=/.next --exclude=/node_modules /file-2/ hahan@172.31.53.108:/file-1/
        ssh hahan@172.31.53.108 -p 2022 /bin/bash -ex <<'ENDSSH'
          docker compose -f docker-compose.yml build
          docker compose -f docker-compose.yml up -d

          exit
      """
    }
      
    stage ('PostBuild') {
      BUILD_FILE.postBuild(this)
      slackNotify("${SUCCESS_STATUS}", "${environment}", false, "${channel}")
    }

  } catch (e) {
    throw e
  } finally {
    // deleteDir()
  }
  
}
