#!/usr/bin/env zsh
set -e

main() {
  find roles/*/README.md | while read line; do \
    local role=$(echo $line | cut -d/ -f2)
    # use BSD sed
    local description=$(/usr/bin/sed -n 2p $line)
    echo "$role^$description"
  done \
  | column -s'^' -t
}

main $@
