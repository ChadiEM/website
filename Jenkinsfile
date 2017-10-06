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
                sh 'rm -r /var/www/chadi/*'
                sh 'cp -r !(Jenkinsfile) /var/www/chadi/'
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
