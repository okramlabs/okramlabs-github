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
  # configure github
  hbb:travis_ci::deploy_config
  cd $OL_ROOT
  git checkout -b deploy-to-github $TRAVIS_COMMIT
  vim -u NONE +'1d' +wq! $TRAVIS_BUILD_DIR/.gitignore
  rm $TRAVIS_BUILD_DIR/public/.gitkeep
  cp $TRAVIS_BUILD_DIR/LICENSE-content $TRAVIS_BUILD_DIR/public/LICENSE
  echo "<h1>okramlabs.github.io ($TRAVIS_BUILD_NUMBE)</h1> $TRAVIS_COMMIT" > $TRAVIS_BUILD_DIR/public/index.html
  echo "Automated deployment of [okramlabs/okramlabs.github.src](https://github.com/okramlabs/okramlabs.github.src) repository" > $TRAVIS_BUILD_DIR/public/readme.md
  # commit changes
  git add -A
  BUILDREF="$TRAVIS_TAG :bookmark:"
  git commit -m"$BUILDREF ($TRAVIS_BUILD_NUMBER) deploy https://github.com/okramlabs/okramlabs.github.src/commit/$TRAVIS_COMMIT"
  hbot::logok "script done"

  git push gh-pages
  hbb::task::done
  hbb::exit 0
}
hbb::travis_ci::deploy_staging
