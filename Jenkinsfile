pipeline {
    agent any
    // Test comment 2

    stages {
        stage('Build') {
            steps{
                echo 'Packaging charts...'
                sh "./build.sh ${env.WORKSPACE}"
            }
        }
        stage('Push'){
            environment {
                JENKINS_SP_USER = credentials('jenkins-sp-user')
                JENKINS_SP_PASS = credentials('jenkins-sp-pass')
                AZ_TENANT = credentials('az_tenant')
                HELM_SHARE_KEY = credentials('helm-fs-key')
                }
            steps {
                echo 'Uploading to Azure...'
                sh "./pushRepo.sh ${JENKINS_SP_USER} ${JENKINS_SP_PASS} ${AZ_TENANT} ${HELM_SHARE_KEY} ${env.WORKSPACE}"
                }
        }
    }
}