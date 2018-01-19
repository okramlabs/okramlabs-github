#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : before_install
# description   : 1. Install additional dependencies required by job
# author        : Marko Kungla
# date          : 2018-01-18T20:37:46+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

# In a before_install step, you can install additional dependencies required
# by your project such as Ubuntu packages or custom services.
hbot::travis_ci::before_install() {
  if ! hbot::is_travis "before_install"; then
    return
  fi
  declare -r SSH_FILE="$(mktemp -u ${HOME}/.ssh/XXXXX)"
  openssl aes-256-cbc -K ${encrypted_86dc7fa5806f_key} -iv ${encrypted_86dc7fa5806f_iv} -in $OL_PATH_RES/travis-ci/deploy_key.enc -out "$SSH_FILE" -d
  chmod 600 "$SSH_FILE" \
    && printf "%s\n" \
      "Host github.com" \
      "  IdentityFile $SSH_FILE" \
      "  LogLevel ERROR" >> ~/.ssh/config
  git config user.email $OL_GIT_USER_NAME
  git config user.name $OL_GIT_USER_EMAIL
  hbot::logok "before_install done"
}
hbot::travis_ci::before_install
