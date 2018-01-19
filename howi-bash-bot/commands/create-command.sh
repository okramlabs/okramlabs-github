#!/bin/bash
hbot::create_command::create() {
  local cmddir=$(dirname  $1)
  local cmdname=$(basename  $cmddir)

  local scmdfilebase=$(basename  $1)
  local scmdname=${scmdfilebase%.*}

  if ! hbot::is_dir "$cmddir"; then
    hbot::logwarn "invalid path $cmddir"
    return
  fi

  if hbot::file_exists $1; then
    logerr "cannot create ($cmdname): $scmdname - file exists!"
    return
  fi

  local cmdcreated="hbot::${cmdname//-/_}::${scmdname//-/_}"
  local cmdhelp="hbot::${cmdname//-/_}::help"

  printf "Enter a command description: "
  read -r description

  # write to a file.
  printf "%s \n%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%-16s%s \n%s \n\n%s\n%s\n" \
"#!/bin/bash" \
$OL_HR \
"# command" ": $cmdname" \
"# sub command" ": $scmdname" \
"# description" ": $description" \
"# author" ": $OL_GIT_USER_NAME" \
"# date" ": $OL_TODAY" \
"# bash_version" ": ${BASH_VERSION}" \
$OL_HR \
"$cmdcreated() { $cmdhelp; }" \
"$cmdcreated" > $1

  if [ "$scmdname" == "index" ]; then
    hbot::logok "command: $cmdname created!"
  else
    hbot::logok "command: $cmdname $scmdname created!"
  fi
  hbot::loginfo "consider add/update $cmdhelp in ./howi-bot"

}

hbot::create_command::index() {
  clear

  hbot::get_commands existing_cmds

  hbot::hr
  hbot::loginfo "following commands exists"
  hbot::hr
  for element in "${existing_cmds[@]}"
  do
    echo "${element}"
  done
  hbot::hr

  hbot::logline "Enter a name of the new command or one listed above if adding subcommand: "
  read -r cmdname
  # Remove the spaces
  cmdname=${cmdname// /_}
  # Convert to lowercase.
  cmdname=${cmdname,,}

  if [[ ! -z $(printf '%s\n' "${existing_cmds[@]}" | grep -w $cmdname) ]]; then
    hbot::loginfo "updating command $cmdname"
    hbot::logline "enter a name of the new sub command: "
    read -r scmdname
    # Remove the spaces
    scmdname=${scmdname// /_}
    # Convert to lowercase.
    scmdname=${scmdname,,}
    hbot::create_command::create "$OL_PATH_CMDS/$cmdname/$scmdname.sh"
  else
    hbot::loginfo "creating command $cmdname"
    if ! hbot::is_dir "$OL_PATH_CMDS/$cmdname"; then
      mkdir -p "$OL_PATH_CMDS/$cmdname"
      if hbot::is_dir "$OL_PATH_CMDS/$cmdname"; then
        hbot::logok "created directory for $cmdname"
        hbot::create_command::create "$OL_PATH_CMDS/$cmdname/index.sh"
      fi
    fi
  fi
}

hbot::create_command::index
