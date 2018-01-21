#!/bin/bash

hbb::get_commands() {
  eval "${1}=()"
  for cmd in $OL_PATH_CMDS/*; do
      [[ -d $cmd ]] && eval "${1}+=(\"$(basename ${cmd})\")"
  done
}

hbb::hr() {
  hbb::logline $OL_DIV
}

hbb::is_dir(){
  if [[ -d $1 ]] && [[ -n $1 ]] ; then
    return 0
  else
    return 1
  fi
}

hbb::file_exists(){
  if [[ -f $1 ]] && [[ -n $1 ]] ; then
    return 0
  else
    return 1
  fi
}
