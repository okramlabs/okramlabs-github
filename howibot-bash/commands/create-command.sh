#!/bin/bash
NEW_CMD_DESCRIPTION=""

hbb::create_command::create() {
  local cmddir=$(dirname  $1)
  local cmdname=$(basename  $cmddir)

  local scmdfilebase=$(basename  $1)
  local scmdname=${scmdfilebase%.*}

  if ! hbb::is_dir "$cmddir"; then
    hbb::logwarn "invalid path $cmddir"
    return
  fi

  if hbb::file_exists $1; then
    logerr "cannot create ($cmdname): $scmdname - file exists!"
    return
  fi

  local cmdcreated="hbb::${cmdname//-/_}::${scmdname//-/_}"
  local cmdhelp="hbb::${cmdname//-/_}::help"

  printf "Enter a command description: "
  read -r NEW_CMD_DESCRIPTION
  # write to a file.
  printf "%s \n%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%s \n\n%s\n%s\n" \
"#!/bin/bash" \
$OL_HR \
"# command" ": $cmdname" \
"# sub command" ": $scmdname" \
"# description" ": $NEW_CMD_DESCRIPTION" \
"# author" ": $OL_GIT_USER_NAME" \
"# date" ": $OL_TODAY" \
"# bash_version" ": ${BASH_VERSION}" \
$OL_HR \
"$cmdcreated() { $cmdhelp; }" \
"$cmdcreated" > $1

  if [ "$scmdname" == "index" ]; then
    hbb::logok "command: $cmdname created!"
  else
    hbb::logok "command: $cmdname $scmdname created!"
  fi
  hbb::loginfo "consider add/update $cmdhelp in ./howibot-bash/src/$cmdname.sh"

}

hbb::create_command::create_config() {
  local cmdfilebase=$(basename  $1)
  local cmdname=${cmdfilebase%.*}

  if hbb::file_exists $1; then
    logwarn "cannot create ($cmdname): config file - file exists!"
    return
  fi

  local cmdhelp="hbb::${cmdname//-/_}::help"

  # write to a file.
  printf "%s \n%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%s \n\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" \
"#!/bin/bash" \
$OL_HR \
"# command" ": $cmdname" \
"# author" ": $OL_GIT_USER_NAME" \
"# date" ": $OL_TODAY" \
"# bash_version" ": ${BASH_VERSION}" \
$OL_HR \
"# add ($cmdname) shared methods and VARS here" \
"# this file is source also by subcommands of ($cmdname)" \
"$cmdhelp() {" \
"  hbb::logbold \" ${cmdname^^} COMMANDS\"" \
"  hbb::logline" \
"  hbb::logline \"    $NEW_CMD_DESCRIPTION\"" \
"  hbb::logline" \
"  hbb::helpcmd \"   $cmdname  \" \"<command> [arg...]\"" \
"  hbb::logline" \
"}" > $1

  hbb::logok "created config file for $cmdname"
  echo $cmdhelp >> "$OL_ROOT/howibot-bash/help-menu.sh"
}

hbb::create_command::index() {
  clear

  hbb::get_commands existing_cmds

  hbb::hr
  hbb::loginfo "following commands exists"
  hbb::hr
  for element in "${existing_cmds[@]}"
  do
    echo "${element}"
  done
  hbb::hr

  hbb::logline "Enter a name of the new command or one listed above if adding subcommand: "
  read -r cmdname
  # Remove the spaces
  cmdname=${cmdname// /_}
  # Convert to lowercase.
  cmdname=${cmdname,,}

  if [[ ! -z $(printf '%s\n' "${existing_cmds[@]}" | grep -w $cmdname) ]]; then
    hbb::loginfo "updating command $cmdname"
    hbb::logline "enter a name of the new sub command: "
    read -r scmdname
    # Remove the spaces
    scmdname=${scmdname// /_}
    # Convert to lowercase.
    scmdname=${scmdname,,}
    hbb::create_command::create "$OL_PATH_CMDS/$cmdname/$scmdname.sh"
  else
    hbb::loginfo "creating command $cmdname"
    if ! hbb::is_dir "$OL_PATH_CMDS/$cmdname"; then
      mkdir -p "$OL_PATH_CMDS/$cmdname"
      mkdir -p "$OL_PATH_RES/$cmdname"
      touch "$OL_PATH_RES/$cmdname/.gitkeep"

      if hbb::is_dir "$OL_PATH_CMDS/$cmdname"; then
        hbb::logok "created command directory for $cmdname"
        hbb::logok "created resources directory for $cmdname"
        hbb::create_command::create "$OL_PATH_CMDS/$cmdname/index.sh"
      fi
      if ! hbb::file_exists "$OL_PATH_SRC/$cmdname.sh"; then
        hbb::create_command::create_config "$OL_PATH_SRC/$cmdname.sh"
      fi
    fi
  fi
}

hbb::create_command::index
