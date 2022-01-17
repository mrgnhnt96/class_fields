#!/bin/bash

source package_functions.sh

runDry

function run() {
  printf "\nStarting...\n"
  waitASec

  verifyVersionAndNotes

  format

  runtests

  publish

  createGitRelease

  printf "\nDone!\n"
}

askQuestion "Do you want run the script for the annotations?"
confirm=$?

if [ $confirm -eq 0 ]; then
  (cd packages/annotation && run)
fi

askQuestion "Do you want run the script for the generator?"
confirm=$?

if [ $confirm -eq 0 ]; then
  (cd packages/generator && run)
fi
