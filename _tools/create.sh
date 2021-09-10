#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)
readonly ROLE_ROOT_PATH=roles


main() {
  local role="${1:?[ERROR] ROLE is required.}"
  local role_path="${ROLE_ROOT_PATH}/${role}"

  if [[ -d ${role_path} ]]; then \
    echo "[ERROR] ${role_path} is already exists.";
    return 1
  fi;

  cp -pr ${CURRENT_PATH}/create ${role_path}
  # use BSD sed
  /usr/bin/sed -i '' -E -e "s/{{ROLE}}/${role}/g" ${role_path}/*

  echo "[INFO] Successfully created ${role_path}.";
}


main $@

