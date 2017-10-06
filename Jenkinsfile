pipeline {
    agent any
    stages {
        stage('Validate') {
            steps {
                checkout scm
                sh 'bootlint -d W005 website/index.html'
            }
        }
        stage('Deploy') {
            steps {
                sh 'rsync -rv website/ /var/www/chadi/ --delete'
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
