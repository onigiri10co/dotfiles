#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)
DOTF_ROLES_FILE=${DOTF_ROLES_FILE:-roles.lst}

main() {
  [[ -f $DOTF_ROLES_FILE ]] || {
    echo "[ERROR] $DOTF_ROLES_FILE is not found."
    return 1
  }

  local role i
  local roles=$(grep -v -e '^\s*#' -e '^\s*$' $DOTF_ROLES_FILE)
  local all=$(echo $roles | wc -w)
  for role in $roles; do
    ((i++))
    zsh $CURRENT_PATH/install.sh ${role} "$i/$all"
  done
}


main $@
