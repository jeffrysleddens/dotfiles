#!/bin/bash
#############################################################################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
#############################################################################

########## Variables

DIR="~/.dotfiles"
OLDDIR="~/.dotfiles_old"
FILES="bash_profile bashrc vimrc vim"

##########

# Create dotfiles_old in homedir.
echo -n "Creating $OLDDIR for backup of any existing dotfiles in ~ ..."
mkdir -p "$OLDDIR"
echo "done"

# Change to the dotfiles directory.
echo -n "Changing to the $DIR directory ..."
cd "$DIR" || (echo "ERROR: Could not change directory to $DIR"; exit 2)
echo "done"

# Move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles
# directory specified in $FILES.
for FILE in $FILES; do
  echo "Moving any existing dotfiles from ~ to $OLDDIR"
  mv ~/."$FILE" "$OLDDIR"/
  echo "Creating symlink to $FILE in home directory."
  ln -s "$DIR"/"$FILE" ~/."$FILE"
done
