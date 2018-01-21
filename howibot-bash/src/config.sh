#!/bin/bash

# OL_BOT_NAME="hhowi-bot"
# OL_ROOT="$(readlink -f "${BASH_SOURCE%/*}")"
# OL_SOURCE_REPO="git@github.com:okramlabs/okramlabs.github.src.git"
# OL_DEST_REPO="git@github.com:okramlabs/okramlabs.github.io.git"

OL_DIV="--------------------------------------------------------------------------------"
OL_HR="################################################################################"

OL_PATH_CMDS="$OL_ROOT/howibot-bash/commands"
OL_PATH_SRC="$OL_ROOT/howibot-bash/src"
OL_PATH_RES="$OL_ROOT/howibot-bash/res"

if hash gdate 2>/dev/null; then
  OL_TODAY=$(gdate --rfc-3339=seconds | sed 's/ /T/')
else
  OL_TODAY=$(date --rfc-3339=seconds | sed 's/ /T/')
fi

if [ $OL_RUN_AS_HOWI_BOT -eq 0 ]; then
  OL_GIT_USER_NAME=$OL_BOT_NAME
  OL_GIT_USER_EMAIL=$OL_BOT_EMAIL
  return
else
  OL_GIT_USER_NAME=$(git config --global user.name)
  OL_GIT_USER_EMAIL=$(git config --global user.email)
fi


: "${HOWIBOT:=""}"
