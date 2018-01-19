#!/bin/bash

hbot::is_travis() {
  if [[ "$CI" == "true" && $TRAVIS="true" ]]; then
    hbot::loginfo "Travis CI $1"
    return 0
  else
    hbot::loginfo "Travis CI $1 skip not a Travis CI build"
    return 1
  fi
}
