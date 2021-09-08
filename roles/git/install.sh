#!/usr/bin/env bash
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)

GIT_USERNAME="${GIT_USERNAME:-onigiri10co}"
GIT_EMAIL="${GIT_EMAIL:-onigiri10co@gmail.com}"
GIT_TEMPLATE_ROOT="$HOME/.git-templates"


# Install git
brew list git > /dev/null 2>&1 || {
  brew install git
}

git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}"

GIT_IGNORE="${GIT_TEMPLATE_ROOT}/.gitignore_global"
curl -sL https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore > "${GIT_IGNORE}"
git config --global core.excludesfile "${GIT_IGNORE}"

GIT_COMMIT_FILE=".gitcommit_global"
GIT_COMMIT="${GIT_TEMPLATE_ROOT}/${GIT_COMMIT_FILE}"
( cd ${CURRENT_PATH}; cp "${GIT_COMMIT_FILE}" "${GIT_TEMPLATE_ROOT}/")
git config --global commit.template "${GIT_COMMIT}"


# Install git-secrets
brew list git-secrets > /dev/null 2>&1 || {
  brew install git-secrets
}

GIT_SECRETS="${GIT_TEMPLATE_ROOT}/git-secrets"
git secrets --install ${GIT_SECRETS} --force > /dev/null
git config --global init.templatedir ${GIT_SECRETS}

