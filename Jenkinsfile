pipeline {

	agent any
	tools {
		maven 'maven-3.8'
	}

	stages {
	
		stage('checkout source-code') {
		
			steps {
			
				git 'https://github.com/nikhil-k1200/final-project.git'
			}
		}
		
		stage('build') {
		
			steps {
			
				sh 'mvn clean install'
			}
		}
		
		stage('send war, Dockerfile to ansible server') {
		
			steps {
			
				sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', 
				transfers: [sshTransfer(cleanRemote: false, excludes: '', 
				execCommand: '', execTimeout: 120000, flatten: false, 
				makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', 
				remoteDirectory: '/123', remoteDirectorySDF: false, removePrefix: 'target', 
				sourceFiles: 'target/*.war')], usePromotionTimestamp: false, 
				useWorkspaceInPromotion: false, verbose: false), 
				sshPublisherDesc(configName: 'ansible', 
				transfers: [sshTransfer(cleanRemote: false, excludes: '', 
				execCommand: '', execTimeout: 120000, flatten: false, 
				makeEmptyDirs: false, noDefaultExcludes: false, 
				patternSeparator: '[, ]+', remoteDirectory: '/123', 
				remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], 
				usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
			}
		}
		
		stage('send playbooks to ansible server') {
		
			steps {
			
			sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', 
			transfers: [sshTransfer(cleanRemote: false, excludes: '', 
			execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, 
			noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/123', 
			remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'playbook.yml, image.yml, hosts')], 
			usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
			}
		}
		
		stage('running playbooks & deploying') {
		
			steps{
			
				sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', 
				transfers: [sshTransfer(cleanRemote: false, excludes: '', 
				execCommand: '''ansible-playbook -i /home/ansible/123/hosts /home/ansible/123/image.yml;
				ansible-playbook -i /home/ansible/123/hosts /home/ansible/123/playbook.yml;''', 
				execTimeout: 120000, flatten: false, makeEmptyDirs: false, 
				noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', 
				remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], 
				usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
			}
		}
	}
}
