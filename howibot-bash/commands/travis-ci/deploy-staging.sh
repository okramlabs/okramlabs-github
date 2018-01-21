#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : deploy-staging
# description   : deploy to staging.
# author        : Marko Kungla
# date          : 2018-01-21T03:38:42+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::deploy_staging() {
  hbb::task::start "travis-ci/deploy-staging"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::deploy_staging
