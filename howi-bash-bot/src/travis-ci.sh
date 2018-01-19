#!/bin/bash
################################################################################
# command       : travis-ci
# author        : Marko Kungla
# date          : 2018-01-19T08:41:13+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

# add (travis-ci) shared methods and VARS here
# this file is source also by subcommands of (travis-ci)
hbot::travis_ci::help() {
  hbot::logbold " TRAVIS-CI COMMANDS"
  hbot::logline
  hbot::logline "    Travis CI Stage management"
  hbot::logline
  hbot::helpcmd "   travis-ci  " "<command> [arg...]"
  hbot::logline
}

hbot::travis_ci::true() {
  if [[ "$CI" == "true" && $TRAVIS="true" ]]; then
    hbot::loginfo "Travis CI $1"
    return 0
  else
    hbot::loginfo "Travis CI $1 skip not a Travis CI build"
    return 1
  fi
}
