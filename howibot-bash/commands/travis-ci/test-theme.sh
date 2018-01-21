#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : test-theme
# description   : test okramlabs.github.io frontend source.
# author        : Marko Kungla
# date          : 2018-01-21T03:25:11+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::test_theme() {
  hbb::task::start "travis-ci/test-theme"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::test_theme
