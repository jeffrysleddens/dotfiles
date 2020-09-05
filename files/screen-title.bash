#!/bin/bash

array=(${PWD//\// })
HN=$( echo $HOSTNAME | tr [:lower:] [:upper:] )

TITLE="$HN:./${array[-1]}"

if [[ "$PWD" =~ $HOME/src/(.*) ]] ; then
  if [ "${array[3]}" == "src" ] && [ ! -z "${array[4]}" ]; then
    TITLE="$HN:GIT:${array[4]}"
  fi
fi

if [ "$PWD" == "$HOME" ]; then
  TITLE="$HN:~"
fi

printf "\033k%s\033\\" "$TITLE"
