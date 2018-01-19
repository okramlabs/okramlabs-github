#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : after_success
# description   : 6. Run scripts after success
# author        : Marko Kungla
# date          : 2018-01-18T20:44:00+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::after_success() {
  if ! hbot::is_travis "after_success"; then
    return
  fi
  deploy
  git checkout deploy-to-github
  git filter-branch --prune-empty --env-filter "
    GIT_COMMITTER_NAME=\"$OL_GIT_USER_NAME\";
    GIT_COMMITTER_EMAIL=\"$OL_GIT_USER_EMAIL\";" --subdirectory-filter public deploy-to-github
  git remote add ghpage $OL_DEST_REPO
  git push -f ghpage deploy-to-github:master
  hbot::logok "after_success done"
}
hbot::travis_ci::after_success
