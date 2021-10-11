#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


timestamp() {
  date '+%Y-%m-%d %H:%M:%S'
}

main() {
  local roles role_path role
  roles=$(find roles ! -path './_tools*' -a ! -path './.git*' -a -name 'install.sh' | sort)

  echo "$(timestamp) [INFO] Install roles list"
  echo ${roles} | sed -E 's/roles\/|\/install.sh//g' | tr ' ' '\n'

  for role_path in ${=roles}; do
    role=$(basename ${role_path%/*})
    echo "$(timestamp) [INFO] Install ${role}..."
    zsh $CURRENT_PATH/install.sh ${role}
  done

  echo "$(timestamp) [INFO] Install successful. Please login again."
}


main $@

