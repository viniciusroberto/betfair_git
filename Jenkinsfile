pipeline {
  agent any
  stages {
    stage('Health Check') {
      steps {
        echo 'Log.....'
        sleep 5
      }
    }

    stage('Teste Contrato') {
      steps {
        echo 'log Teste contrato'
        sleep 5
      }
    }

    stage('Test Api Fluxo') {
      steps {
        echo 'log'
        sleep 7
      }
    }

    stage('Teste API Negocio') {
      steps {
        echo 'Teste API Negocio'
        sleep 4
      }
    }

    stage('Test App') {
      steps {
        echo 'Teste Mobile'
        sleep 10
      }
    }

  }
}
