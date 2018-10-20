pipeline {
    agent none
    triggers {
        githubPush()
    }
    stages {
        stage('Validate') {
            agent { dockerfile true }
            steps {
                sh 'java -jar /usr/local/lib/node_modules/vnu-jar/build/dist/vnu.jar website/*.html'
                sh 'bootlint -d W002,W005 website/*.html'
                sh 'stylelint website/css/*'
            }
        }
        stage('Deploy') {
            agent {
                label 'website'
            }
            when {
                branch 'master'
            }
            steps {
                sh "rsync -rv website/ ${env.WEBSITE_HOME} --delete"
            }
        }
        stage('Deploy to S3') {
            // Has to be done from master, due to https://issues.jenkins-ci.org/browse/JENKINS-47046
            agent {
                label 'master'
            }
            steps {
                withAWS(credentials: 's3', region: 'eu-west-1') {
                    s3Delete bucket: 'chadimasri-website', path: ''
                    s3Upload bucket: 'chadimasri-website', includePathPattern: '**', workingDir: 'website'
                    s3Copy fromBucket: 'cv-chadi-elmasri', fromPath: 'CV.pdf', toBucket: 'chadimasri-website', toPath: 'docs/CV.pdf'
                }
            }
        }
    }
}