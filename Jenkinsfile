pipeline {
    agent none

    tools
    {
        jdk 'MyJava'
        maven 'mymaven'
        }
    parameters {
        string(name: 'Env', defaultValue: 'Test', description: 'Version to compile')
        booleanParam(name: 'executeTest', defaultValue: true, description: 'Decide whether to run test cases')
        choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'], description: 'Choose the app version')
    }

    stages {
        stage('Compile') {
            agent any
            steps {
                echo 'Compiling the code'
                echo "Compiling in ${params.Env}"
                sh 'mvn compile'
            }
        }

        stage('UnitTest') {
            agent any
            when {
                expression { params.executeTest == true }
            }
            steps {
                echo "Testing the code"
                sh 'mvn test'
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'

                }
            }
        }

        stage('Package') {
            agent {
                label 'linux_slave' // 👈 Name of your slave node (must be configured in Jenkins)
            
            }
            input {
                message "Select the Environemnt to deploy"
                ok "Deploy"
                parameters {
                    choice(name: 'NEWAPP', choices: ['ONPREM','EKS','EC2'])
                }
            }
            steps {
                echo 'Packaging the code'
                echo "Packaging the version ${params.APPVERSION}"
                sh 'mvn package'
            }
        }
    }
}
    
    
