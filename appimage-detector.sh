#!/bin/sh
FILE="$1"

[ -z "$FILE" ] && echo "Usage: appimage-detector.sh [path to the binary file]" && exit 1

_notAppImage()
{
	echo "$FILE is not an AppImage"
	exit 0
}

# Check if the file is even a binary executable
FILE_RESULT=$(file "$FILE" | grep "ELF")
[ -z "$FILE_RESULT" ] && _notAppImage

# Run strings on the binary
RESULT=$(strings -d "$FILE" | grep -m 1 "AppImage")
[ -z "$RESULT" ] && _notAppImage || echo "$FILE is an AppImage"
