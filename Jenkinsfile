pipeline {
    agent none
    triggers {
        bitbucketPush()
    }
    stages {
        stage('Validate') {
            agent { dockerfile true }
            steps {
                checkout scm
                sh 'java -jar /usr/lib/node_modules/vnu-jar/build/dist/vnu.jar --skip-non-html website/'
                sh 'bootlint -d W005 website/index.html'
            }
        }
        stage('Deploy') {
            agent any
            when {
                branch 'master'
            }
            steps {
                sh 'rsync -rv website/ /var/www/chadi/ --delete'
                sh 'mkdir /var/www/chadi/docs'
                sh 'ln -s /var/www/others/generated/CV.pdf /var/www/chadi/docs/CV.pdf'
            }
        }
    }
}
