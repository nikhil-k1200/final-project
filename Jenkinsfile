
pipeline {
    agent {
		node {	label 'built-in'
		customWorkspace '/mnt/webapp' }
	}

    stages {
        stage ('code checkout, build, push') {
			
			
            steps {
                    git 'https://github.com/nikhil-k1200/webapp.git'
					tool name: 'maven', type: 'maven'
					sh 'mvn clean install -f /mnt/webapp/'
					sh 'docker build -t devopsnike/webapp:demo1 .'
					sh 'docker push devopsnike/webapp:demo1'
					emailext attachLog: true, 
					body: '''"Please go to ${BUILD_URL} and verify the build"''', 
					recipientProviders: [buildUser()], 
					subject: '${JOB_NAME}, ${BUILD_NUMBER}', 
					to: 'devopsnike@gmail.com'
            }
            
        }
		
		stage('docker run') {
		
			agent {
				node {
					label 'docker'
					customWorkspace '/mnt'
				}
			}
		
			steps {
				sh 'docker run -itd -p 8080:8080 --name nk devopsnike/webapp:demo1'
				emailext attachLog: true, 
				body: '''"Please go to ${BUILD_URL} and verify the build"''', 
				recipientProviders: [buildUser()], 
				subject: '${JOB_NAME}, ${BUILD_NUMBER}', 
				to: 'devopsnike@gmail.com'
			}
		
		}

	}
}
