pipeline {
    agent any
    stages {
        stage("Compile") {
            steps{
                sh "./gradlew compileJava"
            }
        }
        stage("Unit test") {
            steps{
                sh "./gradlew test"
            }
        }
        stage("Package"){
            steps {
                sh "./gradlew build"
            }
        }
        stage("Docker build"){
            steps {
                sh "docker build -t crpavel22/jenkins_test_1 ."
            }
        }
        stage("Docker push"){
            steps {
                sh "docker login -u crpavel22 -p pyWzag-recmuh-7rybgo"
                sh "docker push crpavel22/jenkins_test_1"
            }
        }

        stage("Deploy to staging"){
            steps {
                sh "docker run -d --rm -p 8765:8181 --name jenkins_test_1 crpavel22/jenkins_test_1"
            }
        }

        stage("Acceptance test"){
            steps {
                sleep 60
                sh "./acceptance_test.sh"
            }
        }
    }
    post {
        always {
            sh "docker stop jenkins_test_1"
        }
    }
}