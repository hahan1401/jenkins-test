node {
  env.DEPLOYMENT_SERVER = '172.31.53.108'
	env.DEPLOYMENT_USER = 'hahan'
	env.DEPLOYMENT_APP_PATH = '/home/hahan/fandelo/deploy/fandelo-cms-1'
	env.WORKING_APP_PATH = '/home/fruitful/fandelo/fandelo-cms-2'

  try {

    stage ('PreBuild') {
      echo "var: ${var}"
      echo "========================================================"
    }
    
    stage ("Build") {
      sh """
        rsync -az --delete --rsync-path="mkdir -p ${env.DEPLOYMENT_APP_PATH} && rsync" --exclude=/.next --exclude=/node_modules ${env.WORKSPACE}/ ${env.DEPLOYMENT_USER}@${env.DEPLOYMENT_SERVER}:${env.DEPLOYMENT_APP_PATH}/
          ssh hahan@172.31.53.108 /bin/bash -ex <<'ENDSSH'
            docker compose -f docker-compose.yml build
            docker compose -f docker-compose.yml up -d

            exit
        """
    }
      
    stage ('PostBuild') {
    }

  } catch (e) {
    throw e
  } finally {
    // deleteDir()
  }
  
}