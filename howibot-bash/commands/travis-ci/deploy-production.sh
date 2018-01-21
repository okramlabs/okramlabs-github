#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : deploy-production
# description   : deploy to production.
# author        : Marko Kungla
# date          : 2018-01-21T03:43:37+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::deploy_production() {
  hbb::task::start "travis-ci/deploy-production"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::deploy_production
