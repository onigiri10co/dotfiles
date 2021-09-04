#!/bin/bash -e


readonly ROLE_ROOT_PATH=roles
readonly INSTALL_SHELL=install.sh


main() {
  local role="${1:?[ERROR] role is required.}"
  local role_path="${ROLE_ROOT_PATH}/${role}"
  local installsh_path="${role_path}/${INSTALL_SHELL}"

  [[ -d ${role_path} ]] && {
    [[ ! -e ${installsh_path} ]] && {
      echo "[ERROR] ${installsh_path} is not found."
      return 1
    }
    bash ${installsh_path}
  } || {
    echo "[ERROR] ${role_path} is not found."
    return 1
  }
}


main $@

