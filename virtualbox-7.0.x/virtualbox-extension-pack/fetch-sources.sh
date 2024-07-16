#!/bin/bash

if [ -z "$1" ]; then
  echo "No version specified!"
  exit 1
fi

VERSION=$1

rm -f Oracle_VM*

wget "https://download.virtualbox.org/virtualbox/$VERSION/Oracle_VM_VirtualBox_Extension_Pack-$VERSION.vbox-extpack"
