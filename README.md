https://chromium.googlesource.com/chromiumos/docs/+/master/styleguide/shell.md
```
#!/bin/sh

die() {
  echo "${0##*/}: error: $*" >&2
  exit 1
}

usage() {
  echo "Usage: foo [options] [args]

This does something useful!

Options:
  -o <file>   Write output to <file>
  -v          Run verbosely
  -h          This help screen"
  exit 0
}

main() {
  local flag
  local verbose="false"
  local out="/dev/stdout"

  while getopts 'ho:v' flag; do
    case ${flag} in
      h) usage ;;
      o) out="${OPTARG}" ;;
      v) verbose="true" ;;
      *) die "invalid option found" ;;
    esac
  done

  if [[ ${verbose} == "true" ]]; then
    echo "verbose mode is enabled!"
  else
    echo "will be quiet"
  fi

  if [[ -z ${out} ]]; then
    die "-o flag is missing"
  fi
  echo "writing output to: '${out}'"

  # Now remaining arguments are in "$@".
  ...
}
main "$@"
```
