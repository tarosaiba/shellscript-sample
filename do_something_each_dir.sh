#!/bin/bash
#########################################################################
# Copyright 2020 xxxxxx
#
#
# HISTORY:
# * DATE - v1.0.0  - First Creation (Shuntaro Saiba)
#
#########################################################################

###################################################
# Help
###################################################
show_help() {
  cat <<EOF
Usage: ${0##*/} -p TEST_MODE
       ${0##*/} -h
Do something test in each directory.
Options:
    -t TEST_MODE        The test mode
    -v                  Verbose
Examples:
    ${0##*/} -t mode_a
EOF
}

###################################################
# Functions
###################################################

#======================================
# Do something
# Arguments:
#   None
# Outputs:
#   Writes location to stdout
#======================================
function do_something() {
  local my_arg="$1"

  local my_var
  my_var="$(pwd)"

  echo "${my_var} ${my_arg}"
}


###################################################
# Global Variables
###################################################
DIR_PARENTS="./dir_parents"


###################################################
# Main Function
###################################################
## Arg valiable
test_mode=""

## Arg set
OPTIND=1
while getopts "ht:" opt; do
  case "$opt" in
    h) show_help; exit 0 ;;
    t) test_mode="$OPTARG" ;;
    *) echo "Unhandled option: -$opt" >&2: show_help >&2: exit 1 ;;
  esac
done

## Arg checks
if [[ -z "${test_mode}" ]]; then
  echo "ERROR: test_mode must be set."
  show_help >&2
  exit 1
fi

## List up dirs to do_something
dirs_to_do_something=($(find ${DIR_PARENTS} -type d))

## Do something in each dir
for dir in "${dirs_to_do_something[@]}"; do
  cd ${dir}
  do_something aaa
  cd -
done
