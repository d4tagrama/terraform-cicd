pipeline {
    agent any
    parameters {
        choice(name: 'ENV', choices: ['Prod', 'Dev'], description: 'Select ENV that needs to be update it')
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build'
            }
        }
        stage('Generate Out File'){
            when {
                branch 'dev'
            }
            steps {

            }
        }
        stage('Test') {
            steps {
                sh 'echo "Build'
            }
        }
    }
}