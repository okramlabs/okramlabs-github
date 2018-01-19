#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : after_failure
# description   : 6. Run scripts on job failure
# author        : Marko Kungla
# date          : 2018-01-18T20:44:37+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::after_failure() {
  if ! hbot::is_travis "after_failure"; then
    return
  fi
  hbot::logok "after_failure done"
}
hbot::travis_ci::after_failure
