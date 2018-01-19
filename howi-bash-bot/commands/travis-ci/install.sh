#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : install
# description   : 2. Install any dependencies required by project build
# author        : Marko Kungla
# date          : 2018-01-18T20:39:30+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::install() {
  if ! hbot::is_travis "install"; then
    return
  fi
  hbot::logok "install done"
}
hbot::travis_ci::install
