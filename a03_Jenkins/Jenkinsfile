pipeline {
    agent {
        node {
            label 'maven-label'
        }
    }

    stages {
        stage('Clone GitHub Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/tchatua/dwp_01_tweet_trend.git'
            }
        }
    }
}
