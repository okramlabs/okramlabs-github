#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : generate-assets
# description   : create assets from resources e.g variations from main logo, scale etc.
# author        : Marko Kungla
# date          : 2018-01-21T03:35:17+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbb::travis_ci::generate_assets() {
  hbb::task::start "travis-ci/generate-assets"
  hbb::logwarn "no assets"
  hbb::task::done
  hbb::exit 0
}
hbb::travis_ci::generate_assets
