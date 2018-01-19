#!/bin/bash
################################################################################
# command       : travis-ci
# sub command   : script
# description   : 4. Main job script
# author        : Marko Kungla
# date          : 2018-01-18T20:42:47+01:00
# bash_version  : 4.4.12(1)-release
################################################################################

hbot::travis_ci::script() {
  if ! hbot::is_travis "script"; then
    return
  fi
  git checkout -b deploy-to-github $TRAVIS_COMMIT
  vim -u NONE +'1d' +wq! $TRAVIS_BUILD_DIR/.gitignore
  ## build
  rm $TRAVIS_BUILD_DIR/public/.gitkeep
  cp $TRAVIS_BUILD_DIR/LICENSE-content $TRAVIS_BUILD_DIR/public/LICENSE
  echo "<h1>okramlabs.github.io</h1> $TRAVIS_COMMIT" > $TRAVIS_BUILD_DIR/public/index.html
  echo "Automated deployment of [okramlabs/okramlabs.github.src](https://github.com/okramlabs/okramlabs.github.src) repository" > $TRAVIS_BUILD_DIR/public/readme.md
  # commit changes
  git add -A
  BUILDREF="$TRAVIS_TAG :bookmark:"
  git commit -m"$BUILDREF ($TRAVIS_BUILD_NUMBER) deploy https://github.com/okramlabs/okramlabs.github.src/commit/$TRAVIS_COMMIT"
  hbot::logok "script done"
}
hbot::travis_ci::script
