#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : after_script
# description   : 10. run scripts at last
# author        : Marko Kungla
# date          : 2018-01-18T20:47:30+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::after_script() {
  if ! hbot::is_travis "after_script"; then
    return
  fi
  hbot::logok "after_script done"
}
hbot::travis_ci::after_script
