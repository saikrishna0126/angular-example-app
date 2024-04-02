pipeline {
    agent any

    environment {
        SONAR_SCANNER_HOME = '/opt/sonar-scanner'
        SONAR_PROJECT_KEY = 'jenkins'
    }

    tools {
        nodejs 'nodejs'
    }

    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Sonar Analysis') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonarqube', installationName: 'sonarqube') {
                        sh """
                        ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
                             -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                             -Dsonar.sources=src \
                             -Dsonar.host.url=${SONAR_SERVER_URL} \
                             -Dsonar.login=${SONAR_LOGIN}
                        """
                    }
                }
            }
        }
    }
}
