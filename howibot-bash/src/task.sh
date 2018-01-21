#!/bin/bash
hbb_taskstart=""
hbb_taskname=""

hbb::task::start() {
  hbb::loginfo $(printf "\033[1mstarting task:\033[0m %s\n" "$1")
  hbb_taskname=$1
  hbb_taskstart=$(date +%s.%N)
}

hbb::task::done() {
  local timer=$(echo "$(date +%s.%N) - $hbb_taskstart" | bc)
  hbb::logok $(printf "\033[1mtask done:\033[0m %s" "$hbb_taskname")
  hbb::loginfo $(printf "\033[1mexecution time:\033[0m %.6f seconds" "$timer")
}

hbb::task::failed() {
  local timer=$(echo "$(date +%s.%N) - $hbb_taskstart" | bc)
  hbb::logerr $(printf "\033[1mtask failed:\033[0m %s" "$hbb_taskname")
  hbb::loginfo $(printf "\033[1mexecution time:\033[0m %.6f seconds" "$timer")
  exit 1
}
