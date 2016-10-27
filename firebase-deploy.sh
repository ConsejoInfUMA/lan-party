#!/bin/bash -e
set -o pipefail

node_version = node -v

if [ "$TRAVIS_BRANCH" = "master" ] #&& [ "$TRAVIS_PULL_REQUEST" = "false" ]
then
  git config --global user.email "baena.francisco@gmail.com"
  git config --global user.name "travis auto deployer"
  # Stamp index.html with the date and time of PSK's deploying
  #date_value=`date`
  #sed -i.tmp1 "s/This is another card./This is another card. PSK Deployed at: $date_value/" app/index.html
  # Building Polymer
  polymer build
  # Starting Deploy Process to Firebaseapp.com
  firebase deploy --token "${FIREBASE_TOKEN}"

else
  polymer lint
  polymer test
fi