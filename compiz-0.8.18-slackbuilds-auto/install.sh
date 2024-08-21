#!/bin/bash

set -e

if [ "$EUID" -ne 0 ] ; then
  echo "Please run as root"
  exit
fi

# To have our own output directory (upgradepkg)
export TMP=/tmp/compiz-reloaded-build
#export TMP=/tmp

rm -rf $TMP

# Loop for all base packages
cd compiz
for dir in \
	compiz \
	compiz-bcop \
	libcompizconfig \
	compizconfig-python \
	ccsm \
	compiz-plugins-main \
	compiz-plugins-extra \
	compiz-plugins-experimental \
	emerald \
	emerald-themes \
	fusion-icon \
; do

    echo ""
    echo -e "\e[1;32m ### \e[0m"
    echo -e "\e[1;32m ### Building $dir \e[0m"
    echo -e "\e[1;32m ### \e[0m"
    echo ""
    sleep 1

    ( cd $dir
        sh $dir.SlackBuild || exit 1
        upgradepkg --install-new --reinstall $TMP/$dir-*.t?z
    ) || exit 1

done

mkdir $TMP/slackware-packages
mv $TMP/*.t?z $TMP/slackware-packages

echo ""
echo -e "\e[1;32m ###          \e[0m"
echo -e "\e[1;32m ### Finished: Packages are saved in /tmp/compiz-reloaded-build/slackware-packages \e[0m"
echo -e "\e[1;32m ###          \e[0m"
