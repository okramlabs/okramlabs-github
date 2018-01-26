#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : test-deployment-staging
# description   : run tasks to verify staging deployment.
# author        : Marko Kungla
# date          : 2018-01-21T03:45:49+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::test_deployment_staging() {
  hbb::task::start "travis-ci/test-deployment-staging"
  hbb::logwarn "not configured"
  hbb::task::done
  hbb::exit 0
}
hbb::travis_ci::test_deployment_staging
