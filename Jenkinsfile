pipeline {
    agent any
 
 parameters{ 
    string(name: 'ENV', defaultvalue: 'DEV', description: 'env to compile')
    booleanParam(name: 'executeTest', defaultvalue: true, description: 'decide to run testcase')
    choice(name: 'APPVERSION', choice: ['1.1', '1.2', '1.3', description: 'pick some app version'])
 }
    stages {
        stage('compile') {
            steps {
                script{

                echo 'compile the code'
                echo "Compiling in ${params.ENV}"
            }
        }
    }
}
