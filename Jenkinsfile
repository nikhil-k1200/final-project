pipeline {
    agent any

    stages {
        stage ('code checkout, build, push') {
			
			
            steps {
                    git 'https://github.com/nikhil-k1200/webapp.git'
					tool name: 'maven v3.8', type: 'maven'
					sh 'mvn clean install -f /mnt/webapp/'
					sh 'docker build -t devopsnike/webapp:demo /mnt/webapp/target/'
					sh 'docker push devopsnike/webapp:demo1'
            }
            
        }

	}
}
