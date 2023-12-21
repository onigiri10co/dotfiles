#!/usr/bin/env zsh
set -e

DOTF_REPOSITORY='github.com/onigomex/dotfiles';
DOTF_BRANCH="${DOTF_BRANCH:-main}";
DOTF_WORKPATH=`mktemp -d`


display_logo() {
cat <<EOF
                 _                              _            _             ___ _ _
                (_)                            ( )          | |      _    / __|_) |
      ___  ____  _  ____  ___  ____   ____ _   |/ ___     _ | | ___ | |_ | |__ _| | ____  ___
     / _ \|  _ \| |/ _  |/ _ \|    \ / _  | \ / )/___)   / || |/ _ \|  _)|  __) | |/ _  )/___)
    | |_| | | | | ( ( | | |_| | | | ( (/ / ) X (|___ |  ( (_| | |_| | |__| |  | | ( (/ /|___ |
     \___/|_| |_|_|\_|| |\___/|_|_|_|\____|_/ \_|___/    \____|\___/ \___)_|  |_|_|\____|___/
                  (_____|

     See also: https://$DOTF_REPOSITORY

EOF
}

finally() {
  rm -rf "$DOTF_WORKPATH"
}

exception() {
  echo "[ERROR] Aborted the Installation because it received one of the following signals: 1 2 3 15.";
  finally
  exit 1
}

main() {
  display_logo
  curl -fsSL https://${DOTF_REPOSITORY}/archive/${DOTF_BRANCH}.tar.gz -# | tar xz -C ${DOTF_WORKPATH} --strip=1
  (
    cd ${DOTF_WORKPATH}
    make install
  )
}


trap finally 0
trap exception 1 2 3 15

main
