#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : before_cache
# description   : 5. OPTIONAL before_cache (for cleaning up cache)
# author        : Marko Kungla
# date          : 2018-01-18T20:43:44+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::before_cache() {
  if ! hbot::is_travis "before_cache"; then
    return
  fi
}
hbot::travis_ci::before_cache
