pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest'
            args '--entrypoint=""'
            reuseNode true  
          }
    }
    parameters {
        choice(name: 'ENV', choices: ['prod', 'dev'], description: 'Select ENV that needs to be update it')
        booleanParam(name: 'Debug', defaultValue: false, description: 'Toggle this value if you need create plan file and debug output')
    }
    stages {
        stage('Init'){
            steps {
                sh 'terraform init'
            }
        }
        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Plan') {
            if (${params.Debug} == true) {
                sh 'terraform plan -out=prod.tfplan --var-file=prod.tfvars'
            }else{
                sh 'terraform plan --var-file=prod.tfvars'
            }

        }
        stage('Create new Infraestructure') {
            if({$params.Debug} == true){
                export TF_LOG=DEBUG 
                export TF_LOG_PATH=terraform.log
                terraform apply --var-file=${params.ENV}.tfvars -auto-approve
            }else{
                terraform apply --var-file=${params.ENV}.tfvars -auto-approve
            }        
        }
    }
}