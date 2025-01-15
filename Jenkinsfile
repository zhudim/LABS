pipeline {
    agent {
        docker {
            image 'my-jenkins'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/zhudim/LABS.git'
            }
        }
        stage('Download DEB package') {
            steps {
                sh '''
                    curl -L https://github.com/zhudim/LABS/raw/main/count_files-1.0.deb -o /tmp/count_files-1.0.deb
                '''
            }
        }
        stage('Install DEB') {
            steps {
                sh '''
                    sudo dpkg -i /tmp/count_files-1.0.deb
                '''
            }
        }
        stage('Download script') {
            steps {
                sh '''
                    curl -L https://github.com/zhudim/LABS/raw/main/count_files.sh -o /tmp/count_files.sh
                    chmod +x /tmp/count_files.sh
                '''
            }
        }
        stage('Run script') {
            steps {
                sh '/tmp/count_files.sh'
            }
        }
    }
}