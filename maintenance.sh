#!/bin/bash

echo [*] Updating..
find . -name '*.DS_Store' -type f -delete

echo [*] Cleaning up..
find debs -type f -name '*.deb' -delete
rm -r Packages.bz2

echo [*] Building Debs..
dpkg-deb -bZgzip projects/SetGen debs

echo [*] Scanning Packages..
dpkg-scanpackages ./debs > Packages
bzip2 -fks Packages

echo [=] Done!
