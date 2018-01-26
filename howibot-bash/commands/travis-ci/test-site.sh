#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : test-site
# description   : test okramlabs.github.io site source (backend).
# author        : Marko Kungla
# date          : 2018-01-21T03:31:45+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::test_site() {
  hbb::task::start "travis-ci/test-site"
  hbb::logwarn "no tests"
  hbb::task::done
  hbb::exit 0
}
hbb::travis_ci::test_site
