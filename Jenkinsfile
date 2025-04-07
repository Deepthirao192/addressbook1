pipeline {
    agent any
    
    parameters {
        string(name: 'Env', defaultValue: 'Test', description: 'Version to compile')
        booleanParam(name: 'executeTest', defaultValue: true, description: 'Decide whether to run test cases')
        choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'], description: 'Choose the app version')
    }

    stages {
        stage('Compile') {
            steps {
                echo 'Compiling the code'
                echo "Compiling in ${params.Env}"
            }
        }

        stage('UnitTest') {
            when {
                expression { params.executeTest == true }
            }
            steps {
                echo "Testing the code"
            }
        }

        stage('Package') {
            input {
                message "Select the version to package"
                ok "Version selected"
                parameters {
                    choice(name: 'NEWAPP', choices: ['1.1', '2.1', '3.1'], description: 'Select the version to package')
                }
            }
            steps {
                echo 'Packaging the code'
                echo "Packaging the version ${params.APPVERSION}"
            }
        }
    }
}
