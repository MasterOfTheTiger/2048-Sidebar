#!/usr/bin/env bash
#
# This script assumes a linux environment

echo "*** 2048.firefox: Creating web store package"
echo "*** 2048.firefox: Copying files"

DES=dist/build/2048.firefox
rm -rf $DES
mkdir -p $DES/firefox
mkdir -p $DES/firefox/js
mkdir -p $DES/firefox/img
mkdir -p $DES/firefox/style

cp	  ../popup.html                         $DES/firefox/
cp -R ../js/*								$DES/firefox/js/
cp	  ../meta/*					            $DES/firefox/img/
cp -R ../style/*					        $DES/firefox/style/
cp    ../LICENSE.txt                        $DES/firefox/
cp    ../platform/firefox/manifest.json     $DES/firefox/
cp    ../favicon.ico						$DES/firefox/icon.png

echo "*** 2048.firefox: Generating meta..."
python ../tools/make-webext-meta.py $DES/

if [ "$1" = all ]; then
    echo "*** 2048.firefox: Creating package..."
    pushd $DES > /dev/null
    zip ../$(basename $DES).xpi -qr *
    popd > /dev/null
fi

echo "*** 2048.firefox: Package done."
