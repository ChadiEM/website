pipeline {
    agent any
    stages {
        stage('Validate') {
            steps {
                checkout scm
                sh 'bootlint -d W005 index.html'
            }
        }
        stage('Deploy') {
            steps {
                sh 'rsync -rv ./ /var/www/chadi/ --exclude=Jenkinsfile --exclude=.git --exclude=README.md --delete'
                sh 'mkdir /var/www/chadi/docs'
                sh 'ln -s /var/www/others/generated/CV.pdf /var/www/chadi/docs/CV.pdf'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
