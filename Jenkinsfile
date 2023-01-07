pipeline {

    agent {
	
		node {
			label 'built-in'
			customWorkspace '/mnt/demo'
		}
	}
	
    tools {
                maven 'maven-3.8'
    }

    stages {

        stage('checkout source-code') {

            steps {

                git branch: 'dev', url: 'https://github.com/nikhil-k1200/final-project.git'
            }
        }

        stage('build') {

            steps {

                sh 'mvn clean package'
            }
        }

        stage('send war, Dockerfile to ansible server') {

            steps {

                sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', 
				transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', 
				execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, 
				patternSeparator: '[, ]+', remoteDirectory: '/123', remoteDirectorySDF: false, 
				removePrefix: '/mnt/demo/final-project/target', sourceFiles: '/mnt/demo/final-project/target/*.war')], 
				usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false), 
				sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, 
				excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, 
				noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/123', remoteDirectorySDF: false, 
				removePrefix: '', sourceFiles: 'Dockerfile, hosts, playbook.yml, image.yml')], 
				usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false), 
				sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, 
				excludes: '', execCommand: '''ansible-playbook -i /home/ansible/123/hosts /home/ansible/123/image.yml
			}
		}
    }
}
