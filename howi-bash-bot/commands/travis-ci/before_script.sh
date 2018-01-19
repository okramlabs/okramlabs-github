#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : before_script
# description   : 3. Scripts to run to prepare job
# author        : Marko Kungla
# date          : 2018-01-18T20:40:57+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::before_script() {
  if ! hbot::is_travis "before_script"; then
    return
  fi
  hbot::logok "before_script done"
}
hbot::travis_ci::before_script
