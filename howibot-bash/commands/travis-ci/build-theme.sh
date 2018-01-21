#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : build-theme
# description   : build theme/frontend
# author        : Marko Kungla
# date          : 2018-01-21T03:36:37+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::build_theme() {
  hbb::task::start "travis-ci/build-theme"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::build_theme
