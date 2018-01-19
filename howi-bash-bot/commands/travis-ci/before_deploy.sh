#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : before_deploy
# description   : 7. OPTIONAL prepare deployment
# author        : Marko Kungla
# date          : 2018-01-18T20:45:58+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::before_deploy() {
  if ! hbot::is_travis "before_deploy"; then
    return
  fi
  hbot::logok "before_deploy done"
}
hbot::travis_ci::before_deploy
