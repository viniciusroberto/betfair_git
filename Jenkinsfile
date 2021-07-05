pipeline {
  agent any
  stages {
    stage('HealthCheck') {
      parallel {
        stage('Cartoes-Health Check') {
          steps {
            echo 'Log.....'
            sleep 5
          }
        }

        stage('Pix-Health Check') {
          steps {
            echo 'log'
            sleep 3
          }
        }

        stage('Atendimento-HealthCheck') {
          steps {
            sleep 3
          }
        }

      }
    }

    stage('Teste Contrato') {
      parallel {
        stage('Cartoes-Teste Contrato') {
          steps {
            echo 'log Teste contrato'
            sleep 5
          }
        }

        stage('Pixt-TesteContrato') {
          steps {
            sleep 3
          }
        }

        stage('Atendimento-Contrato') {
          steps {
            sleep 5
          }
        }

      }
    }

    stage('Cartoes-Api Fluxo') {
      parallel {
        stage('Cartoes-Api Fluxo') {
          steps {
            echo 'log'
            sleep 7
          }
        }

        stage('Pix-Api Fluxo') {
          steps {
            sleep 4
          }
        }

        stage('Atnedimento-ApiFluxo') {
          steps {
            sleep 4
          }
        }

      }
    }

    stage('Cartoes-API Negocio') {
      parallel {
        stage('Cartoes-API Negocio') {
          steps {
            echo 'Teste API Negocio'
            sleep 4
          }
        }

        stage('Pix - API Negocio') {
          steps {
            sleep 4
          }
        }

        stage('Atendimento-ApiNegocio') {
          steps {
            sleep 2
          }
        }

      }
    }

    stage('Cartoes-App') {
      parallel {
        stage('Cartoes-App') {
          steps {
            echo 'Teste Mobile'
            sleep 10
          }
        }

        stage('Pix - App') {
          steps {
            sleep 2
          }
        }

        stage('Atendimento App') {
          steps {
            sleep 3
          }
        }

      }
    }

  }
}