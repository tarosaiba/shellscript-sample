#!/bin/bash

###################################################
# My  BASH script template
#
#
# HISTORY:
#
# * DATE - v1.0.0  - First Creation
#
# ##################################################

## Samples
# https://github.com/forseti-security/terraform-google-forseti/blob/master/helpers/setup.sh
# https://github.com/GoogleCloudPlatform/cloud-code-samples/blob/master/test_content.sh
# https://github.com/GoogleCloudPlatform/gke-networking-demos/blob/master/verify-functions.sh
# https://github.com/GoogleCloudPlatform/gke-secure-defaults-demo/blob/master/common.sh

## Reference
# https://devhints.io/bash



#######################################
# Get configuration directory.
# Globals:
#   SOMEDIR
# Arguments:
#   None
# Outputs:
#   Writes location to stdout
#######################################
function get_dir() {
  local name="$1"

  # Separate lines for declaration and assignment:
  local my_var
  my_var="$(my_func)"

  echo "${name}"  # TODO(mrmonkey): Handle the unlikely edge cases (bug ####)
  # Long commands
  ls \
    | sort \
    | uniq
}


verbose='false'
aflag=''
bflag=''
files=''
while getopts 'abf:v' flag; do
  case "${flag}" in
    a) aflag='true' ;;
    b) bflag='true' ;;
    f) files="${OPTARG}" ;;
    v) verbose='true' ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

## Variables
dirs_to_cleanup=

# Constant
readonly PATH_TO_FILES='/some/path'


# If inside a function, consider declaring the loop variable as
# a local to avoid it leaking into the global environment:
# local dir
for dir in "${dirs_to_cleanup[@]}"; do
  if [[ -d "${dir}/${ORACLE_SID}" ]]; then
    log_date "Cleaning up old files in ${dir}/${ORACLE_SID}"
    rm "${dir}/${ORACLE_SID}/"*
    if (( $? != 0 )); then
      error_message
    fi
  else
    mkdir -p "${dir}/${ORACLE_SID}"
    if (( $? != 0 )); then
      error_message
    fi
  fi
done


# IF Sentence
if [[ "${my_var}" == "some_string" ]]; then
  do_something
fi
if [[ -n "${my_var}" ]]; then
  do_something
fi
if [[ "${my_var}" == "val" ]]; then
  do_something
fi
if (( my_var > 3 )); then
  do_something
fi
if [[ "${my_var}" -gt 3 ]]; then
  do_something
fi



# Single function
function main() {

  # the optional parameters string starting with ':' for silent errors snd h for help usage
  local -r OPTS=':h'

  while builtin getopts ${OPTS} opt "${@}"; do

      case $opt in
       h) usage ; exit 0
	     ;;
	  
	  \?)
	      echo ${opt} ${OPTIND} 'is an invalid option' >&2;
	      usage;
	      exit ${INVALID_OPTION}
	      ;;
	  
          :)
	      echo 'required argument not found for option -'${OPTARG} >&2;
	      usage;
	      exit ${INVALID_OPTION}
	      ;;
          *) echo "Too many options. Can not happen actually :)"
             ;;
 	  
      esac
  done
  

  cleanup

  exit 0
}


# Always check return values and give informative return values. 
# see https://google.github.io/styleguide/shell.xml#Checking_Return_Values

# set a trap for (calling) cleanup all stuff before process
# termination by SIGHUBs
trap "cleanup; exit 1" 1 2 3 13 15
# this is the main executable function at end of script
main "$@"
