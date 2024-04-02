pipeline {
    agent any
    environment {
        CHANGE_DIRECTORY = '/var/lib/jenkins/workspace/Angular-project/angular-example-app/'
        //Sonarqube related environment variables
        SONAR_PROJECT_KEY = 'angular_project'
        SONAR_PROJECT_NAME = 'angular_pj'
        SONAR_TOKEN = credentials('Sonar_Global_Token')
        //Harbor related environment variables
        HARBOR_REGISTRY_CREDENTIAL_ID = credentials('Harbor-registry')
        HARBOR_REPOSITORY_NAME = 'projects'
        //Docker related environment variables
        DOCKER_BUILD = 'angular_pj:latest'
        DOCKER_TAG = 'new-harbor2.duckdns.org/projects/angular_pj:latest'
        DOCKER_PUSH = 'new-harbor2.duckdns.org/angular_pj:latest'
        DOCKER_CONTAINER_NAME = 'angular_app'
        DOCKER_PORT = '4200:4200'
    }
    tools {
        nodejs "nodejs"
    }
    stages{
        stage('Install Dependencies and build') {
            steps {
                    // Run npm install command
                sh 'npm install'
                sh 'npm run build'
            }
            post {
                success {
                    slackSend color: '#36a64f', message: "Dependencies and build Success - ${env.JOB_NAME} - ${env.BUILD_NUMBER}"
                }
                failure {
                    slackSend color: '#ff0000', message: "Dependencies and build failed! - ${env.JOB_NAME} - ${env.BUILD_NUMBER}"
                }
            }
        }
