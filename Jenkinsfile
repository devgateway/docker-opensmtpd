#!/usr/bin/env groovy
// Copyright 2019, Development Gateway, see COPYING
pipeline {
  agent any

  environment {
    APP_NAME = 'opensmtpd'
    VENDOR = 'devgateway'
  }

  stages {
    stage('Build') {
      steps {
        script {
          env.TAG = env.BRANCH_NAME == 'master' ? 'latest' : env.BRANCH_NAME
          docker.withRegistry('', 'dockerhub-ssemenukha') {
            docker.build("$VENDOR/$APP_NAME").push(env.TAG)
          }
        }
      }
    } // Build
  } // stages

  post {
    success {
      script {
        def msg = sh(
          returnStdout: true,
          script: 'git log --oneline --format=%B -n 1 HEAD | head -n 1'
        )
        slackSend(
          message: "Built <$BUILD_URL|$JOB_NAME $BUILD_NUMBER>: $msg",
          color: "good"
        )
      }
    }
  }
}
