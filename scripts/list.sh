#!/usr/bin/env zsh
set -e

main() {
  # use BSD sed
  find roles/*/README.md | while read line; do \
    paste -d'^' -s <(
      echo $line | cut -d/ -f2;
      /usr/bin/sed -n 2p $line;
    );
  done \
  | column -s'^' -t
}


main $@
