#!/bin/bash

if [ -z "$1" ]; then
  echo "No version specified!"
  exit 1
fi

VERSION=$1

rm -f SDKRef.pdf UserManual.pdf VBoxGuestAdditions_*.iso VirtualBox-*.tar.lz

wget "http://download.virtualbox.org/virtualbox/$VERSION/VirtualBox-$VERSION.tar.bz2"
wget "http://download.virtualbox.org/virtualbox/$VERSION/VBoxGuestAdditions_$VERSION.iso"
wget "http://download.virtualbox.org/virtualbox/$VERSION/UserManual.pdf"
wget "http://download.virtualbox.org/virtualbox/$VERSION/SDKRef.pdf"

bunzip2 VirtualBox-$VERSION.tar.bz2
plzip -9 VirtualBox-$VERSION.tar
