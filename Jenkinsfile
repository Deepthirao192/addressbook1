pipeline {
    agent any
    
    parameters {
        string(name: 'Env', defaultValue: 'Test', description: 'Version to compile')
        booleanParam(name: 'executeTest', defaultValue: true, description: 'Decide whether to run test cases')
        choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'])
    }

    stages {
        stage('Compile') {
            steps {
                echo 'compiling the code'
                echo "compiling  in ${params.Env}"
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
        steps{
            echo 'Packaging the code'
            echo 'packaging the version ${params.APPVERSION}'
        }
    }
    }
}
