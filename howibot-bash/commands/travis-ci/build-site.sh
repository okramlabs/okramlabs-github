#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : build-site
# description   : build site (backend) using latest theme.
# author        : Marko Kungla
# date          : 2018-01-21T03:37:26+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::build_site() {
  hbb::task::start "travis-ci/build-site"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::build_site