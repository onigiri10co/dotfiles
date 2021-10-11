#!/usr/bin/env zsh
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
    zsh ${installsh_path}
  else
    echo "[ERROR] ${role_path} is not found."
    return 1
  fi 
}

_dependencies() {
  local role_path="${1:?[ERROR] role_path is required.}"
  local dependencies_path="${role_path}/${DEPENDENCIES_FILE}"

  if [[ -e ${dependencies_path} ]]; then
    cat ${dependencies_path}
  fi
}

_source_role_zshrc() {
  setopt +o nomatch

  [[ -d ~/.zsh.d ]] && ls ~/.zsh.d/* | grep -E '.*(zshrc|zshrc.env|zshrc.alias)$' > /dev/null 2>&1 || return 0

  if [[ ! -f ~/.zsh.d/.zshrc || $(ls -t  ~/.zsh.d/*.{zshrc,zshrc.env,zshrc.alias} 2>/dev/null | head -n1) -nt ~/.zsh.d/.zshrc ]]; then
    rm -f ~/.zsh.d/.zshrc
    ls ~/.zsh.d/*.zshrc.env >/dev/null 2>&1 && cat ~/.zsh.d/*.zshrc.env >> ~/.zsh.d/.zshrc
    ls ~/.zsh.d/*.zshrc.alias >/dev/null 2>&1 && cat ~/.zsh.d/*.zshrc.alias >> ~/.zsh.d/.zshrc
    ls ~/.zsh.d/*.zshrc >/dev/null 2>&1 && cat ~/.zsh.d/*.zshrc >> ~/.zsh.d/.zshrc
  fi

  if [[ ! -f ~/.zsh.d/.zshrc.zwc || ~/.zsh.d/.zshrc -nt ~/.zsh.d/.zshrc.zwc ]]; then
    zcompile ~/.zsh.d/.zshrc
  fi

  source ~/.zsh.d/.zshrc
}

main() {
  local ownrole="${1:?[ERROR] ROLE is required.}"
  local role_path="${ROLE_ROOT_PATH}/${ownrole}"

  local source_path
  for role in $(_dependencies ${role_path}) ${ownrole}; do
    _source_role_zshrc
    _install ${role} || return $?
  done
}


main $@

