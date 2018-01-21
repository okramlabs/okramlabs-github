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

hbb::is_dir() {
  if [[ -d $1 ]] && [[ -n $1 ]] ; then
    return 0
  else
    return 1
  fi
}

hbb::file_exists() {
  if [[ -f $1 ]] && [[ -n $1 ]] ; then
    return 0
  else
    return 1
  fi
}

hbb::has_cla() {
  local cla_ok=1
  hbb::logwarn "hbb::has_cla check not implemented"
  if [ $cla_ok -eq 0 ]; then
    hbb::logok "CLA (Contributor License Agreement) signed"
    return 0
  else
    hbb::logwarn "CLA (Contributor License Agreement) not signed"
    return 1
  fi
}

# e.g  "HOWIBOT" "verify-pull-request"
hbb::has_env_with_val() {
  local varname="${1:=""}"
  local varval="${2:=""}"
  if [[ ! -v "${varname}" ]]; then
    hbb::loginfo "no" $varname
    return 1
  else
    if [[ "${!varname}" == "$varval" ]]; then
      return 0
    else
      return 1
    fi
  fi
}
