#!/usr/bin/env bash
set -e

readonly ROLE_ROOT_PATH=roles
readonly INSTALL_SHELL=install.sh
readonly DEPENDENCIES_FILE=dependencies


_install() {
  local role="${1:?[ERROR] role is required.}"
  local role_path="${ROLE_ROOT_PATH}/${role}"
  local installsh_path="${role_path}/${INSTALL_SHELL}"

  if [[ -d ${role_path} ]]; then
    if [[ ! -e ${installsh_path} ]]; then
      echo "[ERROR] ${installsh_path} is not found."
      return 1
    fi
    bash ${installsh_path}
  else
    echo "[ERROR] ${role_path} is not found."
    return 1
  fi 
}

_list() {
  local role_path="${1:?[ERROR] role_path is required.}"
  local dependencies_path="${role_path}/${DEPENDENCIES_FILE}"

  if [[ -e ${dependencies_path} ]]; then
    cat ${dependencies_path}
  fi
}

main() {
  local ownrole="${1:?[ERROR] ROLE is required.}"
  local role_path="${ROLE_ROOT_PATH}/${ownrole}"

  local source_path
  for role in $(_list ${role_path}) ${ownrole}; do
    _install ${role} || return $?
    source_path="$HOME/.zsh.d/${role}.zshrc"
    if [[ -e ${source_path} ]]; then
      source ${source_path}
    fi
  done
}


main $@

