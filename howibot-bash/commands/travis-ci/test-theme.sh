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


  if ! hbb::has_env_with_val "OL_THEME_NAME" "okramlabs"; then
    hbb::logwarn "this pipeline supports only hugo-okramlabs-theme"
    hbb::task::failed
  fi

  if ! hbb::is_dir $OL_THEME_ROOT; then
    hbb::logerr "hugo-okramlabs-theme not found in themes/okramlabs"
    hbb::task::failed
  fi

  cd $OL_THEME_ROOT
  hbb::logok "cd $OL_THEME_ROOT"

  yarn install
  hbb::logok "yarn install"

  yarn lint
  hbb::logok "yarn lint"

  yarn test
  hbb::logok "yarn test"

  hbb::task::done
  hbb::exit 0
}
hbb::travis_ci::test_theme
