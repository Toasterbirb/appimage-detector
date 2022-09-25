# appimage-detector
A short script for checking if a binary is an AppImage or not, since it might not really be as simple as checking the file extension if that is removed. You might be able to spot AppImages with their filesize though, but that's not really a metric you can 100% trust these days

## Usage
Simply give the script a binary to check like this
```sh
$ ./appimage-detector.sh ~/.local/bin/appimage-builder
/home/toasterbirb/.local/bin/appimage-builder is an AppImage
$ ./appimage-detector.sh /usr/bin/steam
/usr/bin/steam is not an AppImage
```

## How does it work
It's quite simple really! You could do these steps quite quickly manually aswell. No need for this script at all if you need to only check one or two files.

The script first checks if the file is a binary file by running the `file` command on the filepath given. If the result includes "ELF", it'll then run `strings` command on the file and `grep` for "appimage" in the output. If the `grep` command returns any results, you can be pretty certain that the file is an AppImage
