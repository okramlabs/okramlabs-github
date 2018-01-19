#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : after_deploy
# description   : 9. OPTIONAL after deploy"
# author        : Marko Kungla
# date          : 2018-01-18T20:47:04+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::after_deploy() {
  if ! hbot::is_travis "after_deploy"; then
    return
  fi
  hbot::logok "after_deploy done"
}
hbot::travis_ci::after_deploy
