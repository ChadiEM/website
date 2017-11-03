pipeline {
    agent none
    triggers {
        githubPush()
    }
    stages {
        stage('Validate') {
            agent { dockerfile true }
            steps {
                checkout scm
                sh 'java -jar /usr/lib/node_modules/vnu-jar/build/dist/vnu.jar --skip-non-html website/'
                sh 'bootlint -d W002,W005 website/index.html'
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
    }
}
