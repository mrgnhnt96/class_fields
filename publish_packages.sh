#!/bin/bash

source package_functions.sh

runDry

function run() {
  local ignoreGitRelease
  ignoreGitRelease=$([ -z "$1" ] && echo false || echo true)

  printf "\nStarting...\n"
  waitASec

  verifyVersionAndNotes

  format

  runtests

  publish

  if $ignoreGitRelease; then
    echo "Ignoring git release..."
  else
    createGitRelease
  fi

  printf "\nDone!\n"
}

askQuestion "Do you want run the script for the annotations?"
confirm=$?

if [ $confirm -eq 0 ]; then
  (cd packages/class_fields_annotation && run)
fi

askQuestion "Do you want run the script for the generator?"
confirm=$?

if [ $confirm -eq 0 ]; then
  (cd packages/class_fields_generator && run -i)
fi
