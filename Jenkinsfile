node {
  env.DEPLOYMENT_SERVER = '172.31.53.108'
	env.DEPLOYMENT_USER = 'hahan'
	env.DEPLOYMENT_APP_PATH = '/home/hahan/jenkins-test1'
	env.WORKING_APP_PATH = '/home/hahan/jenkins-test-2'

  try {

    stage ('PreBuild') {
      echo "var: ${var}"
      echo "========================================================"
    }
    
    stage ("Build") {
      sh """
        docker cp ./*:!**/node_modules fb775d5b3c60:var/jenkins_home/workspace/new-folder
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