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
            agent any
            steps {
                s3Upload entries: [[bucket: 'chadimasri-website', sourceFile: 'website/**', gzipFiles: true, selectedRegion: 'eu-west-1']],
                    profileName: 'website-bucket',
                    pluginFailureResultConstraint: 'FAILURE',
                    userMetadata: [],
                    consoleLogLevel: 'INFO',
                    dontWaitForConcurrentBuildCompletion: false
            }
        }
    }
}