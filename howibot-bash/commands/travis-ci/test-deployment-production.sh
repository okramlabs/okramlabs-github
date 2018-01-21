#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : test-deployment-production
# description   : run tasks to verify production deployment.
# author        : Marko Kungla
# date          : 2018-01-21T03:46:43+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::test_deployment_production() {
  hbb::task::start "travis-ci/test-deployment-production"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::test_deployment_production
