pipeline {

	agent any
	tools{
		maven 'maven-3.8'
	}

	stages {
	
		stage('code checkout') {
		
			steps {
			
				git 'https://github.com/nikhil-k1200/webapp.git'
			}
		}
		
		stage('build') {
		
			steps {
			
				sh 'mvn clean install'
			}
		}
		
		stage('deploy to ansible') {
		
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
		
		stage('build image using ansible playbook') {
		
			steps {
			
			sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', 
			transfers: [sshTransfer(cleanRemote: false, excludes: '', 
			execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, 
			noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/123', 
			remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'playbook.yml, image.yml, hosts')], 
			usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
			}
		}
		
		stage('running playbooks') {
		
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
