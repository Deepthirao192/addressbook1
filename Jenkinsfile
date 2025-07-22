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
            agent any
        
            input {
                message "Select the env to deploy"
                ok "Deploy"
                parameters {
                    choice(name: 'NEWAPP', choices: ['Onprem','EC2','EKS'])
                }
            }
            steps{
            script{
                sshagent(['deploy_server']) {
                echo"packaging the code"
                sh "scp -o StrictHostKeyChecking=no server-config.sh ec2-user@72.31.6.247:/home/ec2-user"
                sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.6.247 /bash server-config.sh"
}
            
        }
    }
}
}
}
    
    
