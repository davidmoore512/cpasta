#!/bin/bash
#
#   Use rofi to serve up the most delicious copy-pasta into the current window
#
#   Requirements:
#   	rofi, xdotool
#
#	Usage:
#		Save plain text files to a directory of your choice.
#		Update pantry variable to point to this directory.
#		Ensure that cpasta.sh is executable.
#		Create a keyboard shortcut in your desktop environment to run to cpasta.sh script. I use Super-Shift-v 
#
#

# Where to save the files.
pantry="$HOME/Documents/cpasta"

# Get listing of files in your directory. -1 flag (that is number one) outputs 1 file per line
menu=$(ls -1 "$pantry")

# Display file names and get selection
pasta=$(echo "$menu" | rofi -dmenu -i -p "Choose your pasta")

#  Output contents of file, convert linefeed to carriage return, and save result to variable
dish=$(cat "$pantry/$pasta" | tr \\n \\r | sed s/\\r*\$//)

# Delay pasting so the current window will be active again
sleep 0.1

# Type contents of file to current window. Removing the --delay flag will increase delay to default of 12ms.
xdotool type --delay 0 "$dish"
