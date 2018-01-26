#!/bin/bash
################################################################################
# command       : travis-ci
# author        : Marko Kungla
# date          : 2018-01-19T08:41:13+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

: "${CI:="false"}"
: "${TRAVIS:="false"}"


# add (travis-ci) shared methods and VARS here
# this file is source also by subcommands of (travis-ci)
hbb::travis_ci::help() {
  hbb::logbold " TRAVIS-CI COMMANDS"
  hbb::logline
  hbb::logline "    Travis CI Stage management"
  hbb::logline "    OPTIONAL Install apt addons and cache components can be added to travis yaml"
  hbb::logline
  hbb::helpcmd "   travis-ci  " "<command> [arg...]"
  hbb::logline
  hbb::helpcmd "     build-site                 " "build site (backend) using latest theme."
  hbb::helpcmd "     build-theme                " "build theme/frontend"
  hbb::helpcmd "     create-github-release      " "create GitHub release for production and upload release assets."
  hbb::helpcmd "     deploy-production          " "deploy to production."
  hbb::helpcmd "     deploy-staging             " "deploy to staging."
  hbb::helpcmd "     generate-assets            " "create assets from resources e.g variations from main logo, scale etc."
  hbb::helpcmd "     test-deployment-production " "run tasks to verify production deployment."
  hbb::helpcmd "     test-deployment-staging    " "run tasks to verify staging deployment."
  hbb::helpcmd "     test-site                  " "test okramlabs.github.io site source (backend)."
  hbb::helpcmd "     test-theme                 " "test okramlabs.github.io frontend source."
  hbb::helpcmd "     verify-pull-request        " "verify PR's, like CLA etc. before any other build step."
  hbb::logline
}

hbb::travis_ci::true() {
  if [[ "$CI" == "true" && $TRAVIS="true" ]]; then
    hbb::loginfo "Travis CI"
    return 0
  else
    hbb::loginfo "Travis CI skip not a Travis CI"
    return 1
  fi
}

hbb:travis_ci::deploy_config() {
  declare -r SSH_FILE="$(mktemp -u ${HOME}/.ssh/XXXXX)"
  openssl aes-256-cbc -K ${encrypted_86dc7fa5806f_key} -iv ${encrypted_86dc7fa5806f_iv} -in $OL_PATH_RES/travis-ci/howibot_deploy_key.enc -out "$SSH_FILE" -d
  chmod 600 "$SSH_FILE" \
    && printf "%s\n" \
      "Host github.com" \
      "  IdentityFile $SSH_FILE" \
      "  LogLevel ERROR" >> ${HOME}/.ssh/config
  git config user.email $OL_GIT_USER_NAME
  git config user.name $OL_GIT_USER_EMAIL
  hbb::logok "git setup done"
}
#   hbb::helpcmd "     install             " "2. Install any dependencies required by project build"
#   hbb::helpcmd "     before_script       " "3. Scripts to run to prepare job"
#   hbb::helpcmd "     script              " "4. Main job script"
#   hbb::helpcmd "     before_cache        " "5. OPTIONAL before_cache (for cleaning up cache)"
#   hbb::helpcmd "     after_success       " "6. Run scripts after success"
#   hbb::helpcmd "     after_failure       " "6. Run scripts on job failure"
#   hbb::helpcmd "     before_deploy       " "7. OPTIONAL prepare deployment"
#   hbb::helpcmd "     deploy              " "8. OPTIONAL deploy"
#   hbb::helpcmd "     after_deploy        " "9. OPTIONAL after deploy"
#   hbb::helpcmd "     after_script        " "10. run scripts at last"
