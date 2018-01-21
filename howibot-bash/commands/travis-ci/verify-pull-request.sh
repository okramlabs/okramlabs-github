#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : verify-pull-request
# description   : verify PR's, like CLA etc. before any other build step.
# author        : Marko Kungla
# date          : 2018-01-21T03:00:53+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::verify_pull_request() {
  hbb::task::start "travis-ci/verify-pull-request"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::verify_pull_request
