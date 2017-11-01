pipeline {
    agent none
    triggers {
        githubPush()
    }
    stages {
        stage('Static Validation') {
            agent { dockerfile true }
            steps {
                checkout scm
                sh 'java -jar /usr/lib/node_modules/vnu-jar/build/dist/vnu.jar website/*.html'
                sh 'bootlint -d W002,W005 website/*.html'
                sh 'stylelint website/css/*'
            }
        }
        stage('Deploy') {
            agent any
            when {
                branch 'master'
            }
            steps {
                sh "rsync -rv website/ ${env.WEBSITE_HOME} --delete"
            }
        }
        stage('Post-deployment Validation') {
            agent { dockerfile true }
            when {
                branch 'master'
            }
            steps {
                sh 'sonar https://chadimasri.com > sonar'
                archiveArtifacts 'sonar'
            }
        }
    }
}