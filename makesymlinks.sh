#!/bin/bash
#############################################################################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
#############################################################################

########## Variables

DIR=~/.dotfiles
OLDDIR=~/.dotfiles_old
FILES="bash_profile bashrc profile vimrc vim"

##########

set -e

# Create dotfiles_old in homedir.
mkdir -p "$OLDDIR"

# Change to the dotfiles directory.
cd "$DIR" || (echo "ERROR: Could not change directory to $DIR"; exit 2)

# Move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles
# directory specified in $FILES.
for FILE in $FILES; do
  if [ -h ~/."$FILE" ]; then
    rm -f ~/."$FILE"
  elif [ -e ~/."$FILE" ]; then
    mv ~/."$FILE" "$OLDDIR"/
  fi
  ln -s "$DIR"/"$FILE" ~/."$FILE"
done
