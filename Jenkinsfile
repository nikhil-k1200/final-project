pipeline {
    agent {
		node {	label 'built-in'
		customWorkspace '/mnt/webapp' }
	}

    stages {
        stage ('code checkout, build, push') {
			
			
            steps {
                    git 'https://github.com/nikhil-k1200/webapp.git'
					tool name: 'maven v3.8', type: 'maven'
					sh 'mvn clean install -f /mnt/webapp/'
					sh 'docker build -t devopsnike/webapp:demo1 .'
					sh 'docker push devopsnike/webapp:demo1'
            }
            
        }
		
		stage('docker run') {
		
			agent {
				node {
					label 'docker'
				}
			}
		
			steps {
				sh 'docker run -itd -p 8080:8080 --name nk devopsnike/webapp:demo1'
			}
		
		}

	}
}
