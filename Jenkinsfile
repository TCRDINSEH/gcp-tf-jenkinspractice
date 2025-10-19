pipeline {
  agent any

  environment {
    PROJECT_ID = "fundamental-run-464208-v1"
    // REGION = "us-central1"
    // CLUSTER_NAME = "jenkins-gke"
    GCP_CREDENTIALS = "gcp-service-account"  // Jenkins Secret File credential
  }

  stages {
       stage('Checkout Code') {
            steps {
               sh 'git clone https://github.com/TCRDINSEH/gcp-tf-jenkinspractice.git' // or use checkout scm
               sh 'pwd'
            }
        }

    stage('Authenticate to GCP') {
      steps {
        withCredentials([file(credentialsId: "${GCP_CREDENTIALS}", variable: 'GCP_KEYFILE')]) {
          sh '''
            echo "🔐 Authenticating to GCP..."
            gcloud auth activate-service-account --key-file=$GCP_KEYFILE
            gcloud config set project ${PROJECT_ID}
          '''
        }
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          withCredentials([file(credentialsId: "${GCP_CREDENTIALS}", variable: 'GCP_KEYFILE')]) {
            sh '''
              echo "⚙️ Initializing Terraform..."
              export GOOGLE_APPLICATION_CREDENTIALS="$GCP_KEYFILE"
              terraform init -input=false
            '''
          }
        }
      }
    }

    stage('Terraform Validate') {
      steps {
        dir('terraform') {
          sh '''
            echo "✅ Validating Terraform configuration..."
            terraform validate
          '''
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('terraform') {
          withCredentials([file(credentialsId: "${GCP_CREDENTIALS}", variable: 'GCP_KEYFILE')]) {
            sh '''
              echo "🧩 Planning GKE deployment..."
              export GOOGLE_APPLICATION_CREDENTIALS="$GCP_KEYFILE"
              terraform plan -input=false \
                -var="project_id=${PROJECT_ID}" \
                -var="region=${REGION}" \
                -var="cluster_name=${CLUSTER_NAME}" \
                -var="credentials_file=$GCP_KEYFILE"
            '''
          }
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          withCredentials([file(credentialsId: "${GCP_CREDENTIALS}", variable: 'GCP_KEYFILE')]) {
            input message: "Approve Terraform Apply?"
            sh '''
              echo "🚀 Applying Terraform changes (creating GKE)..."
              export GOOGLE_APPLICATION_CREDENTIALS="$GCP_KEYFILE"
              terraform apply -auto-approve                 
            '''
          }
        }
      }
    }

    stage('Verify GKE Cluster') {
      steps {
        withCredentials([file(credentialsId: "${GCP_CREDENTIALS}", variable: 'GCP_KEYFILE')]) {
          sh '''
            echo "☸️ Verifying GKE cluster..."
            gcloud auth activate-service-account --key-file=$GCP_KEYFILE
            gcloud container clusters list --project ${PROJECT_ID}
          '''
        }
      }
    }
  }

  post {
    success {
      echo "✅ Terraform successfully created GKE cluster!"
    }
    failure {
      echo "❌ Terraform pipeline failed — check logs."
    }
  }
}
