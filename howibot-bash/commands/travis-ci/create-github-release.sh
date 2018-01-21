#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : create-github-release
# description   : create GitHub release for production and upload release assets.
# author        : Marko Kungla
# date          : 2018-01-21T03:49:09+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::create_github_release() {
  hbb::task::start "travis-ci/create-github-release"
  hbb::travis_ci::help
  hbb::task::failed
}
hbb::travis_ci::create_github_release
