#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


timestamp() {
  date '+%Y-%m-%d %H:%M:%S'
}

main() {
  local roles role_path role

  if [[ -f $DOTF_ROLES_FILE ]]; then
    while read role; do
      [[ $role =~ ^# ]] && continue
      roles="$roles $role"
    done < <(cat $DOTF_ROLES_FILE)
    roles=$(echo "${roles}" | tr ' ' '\n' | sed '/^$/d')
  else
    roles=$(find roles ! -path './_tools*' -a ! -path './.git*' -a -name 'install.sh' | sort)
  fi

  echo "$(timestamp) [INFO] Install roles list"
  echo ${roles} | sed -E 's/roles\/|\/install.sh//g' | tr ' ' '\n'

  for role_path in ${=roles}; do
    role=$(basename ${role_path%/*})
    zsh $CURRENT_PATH/install.sh ${role}
  done

  echo "$(timestamp) [INFO] Install successful. Please login again."
}


main $@

