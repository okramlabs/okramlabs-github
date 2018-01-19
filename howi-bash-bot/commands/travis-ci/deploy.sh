#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : deploy
# description   : 8. OPTIONAL deploy
# author        : Marko Kungla
# date          : 2018-01-18T20:46:36+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::deploy() {
  if ! hbot::is_travis "deploy"; then
    return
  fi
  hbot::logok "deploy done"
}
hbot::travis_ci::deploy
