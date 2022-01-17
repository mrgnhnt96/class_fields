#!/bin/bash

source package_functions.sh

runDry

function run() {
  ignoreGitRelease=false

  while getopts i: flag
  do
    case "${flag}" in
      i)
        ignoreGitRelease=true
        ;;
      *)
        ;;
    esac
  done
  printf "\nStarting...\n"
  waitASec

  verifyVersionAndNotes

  format

  runtests

  publish

  if $ignoreGitRelease; then
    echo "Ignoring git release..."
    return 0
  fi

  createGitRelease

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
  (cd packages/class_fields_generator && run)
fi
