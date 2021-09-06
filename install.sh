#!/bin/bash -e

DOTF_REPOSITORY='github.com/onigiri10co/dotfiles';
DOTF_BRANCH="${DOTF_BRANCH:-main}";
DOTF_WORKPATH=`mktemp -d`


display_logo() {
cat <<EOF
      ───────────────╔╗╔═══╗────────────╔╗──╔╗╔═╗╔╗
      ──────────────╔╝║║╔═╗║─────╔╗─────║║─╔╝╚╣╔╝║║
      ╔══╦═╗╔╦══╦╦═╦╬╗║║║║║╠══╦══╣╠══╗╔═╝╠═╩╗╔╝╚╦╣║╔══╦══╗
      ║╔╗║╔╗╬╣╔╗╠╣╔╬╣║║║║║║║╔═╣╔╗╠╣══╣║╔╗║╔╗║╠╗╔╬╣║║║═╣══╣
      ║╚╝║║║║║╚╝║║║║╠╝╚╣╚═╝║╚═╣╚╝║╠══║║╚╝║╚╝║╚╣║║║╚╣║═╬══║
      ╚══╩╝╚╩╩═╗╠╩╝╚╩══╩═══╩══╩══╝╚══╝╚══╩══╩═╩╝╚╩═╩══╩══╝
      ───────╔═╝║
      ───────╚══╝


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
    make install-all
  )
}


trap finally 0
trap exception 1 2 3 15

main
