#!/usr/bin/env bash
#
# This script assumes a lin...windows with cygwin environment

echo "*** 2048.firefox: Creating web store package"
echo "*** 2048.firefox: Copying files"

DES=dist/build/2048.firefox
rm -rf $DES
mkdir -p $DES/

cp	  ../popup.html                         $DES/
cp -R ../js/								$DES/
cp -R ../meta/					            $DES/
cp -R ../style/								$DES/
cp    ../LICENSE.txt                        $DES/
cp    ../platform/firefox/manifest.json     $DES/
cp    ../favicon.ico						$DES/icon.png

if [ "$1" = b ]; then
    echo "*** 2048.firefox: Creating package..."
    pushd $DES > /dev/null
    zip -r ../$(basename $DES).xpi *
	popd > /dev/null
fi

echo "*** 2048.firefox: Package done."
