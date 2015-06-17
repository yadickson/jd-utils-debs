#!/bin/bash

set -ex

PKG="${1}"
VERSION="${2}"
ZIPFILE="${PKG}-${VERSION}.zip"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.xz"

[ ! -f "${ORIG_TARBALL}" ] || exit 0

SHA=$(echo "${VERSION}" | awk -F'~' '{print $2}')
VER=$(echo "${VERSION}" | awk -F'+' '{print $1}')

rm -rf "${PKG}"*
rm -rf "${PKG}-${VER}"
rm -f "${ZIPFILE}"

wget -c -t 1 -T 5 "https://github.com/svn2github/jd-utils/archive/${SHA}.zip" -O "${ZIPFILE}" || exit 1

unzip "${ZIPFILE}" || exit 1

rm -f "${ZIPFILE}"

mv "jd-utils"* "${PKG}-${VER}"

rm -rf "${PKG}-${VER}"/.settings
rm -f "${PKG}-${VER}"/.classpath
rm -f "${PKG}-${VER}"/.project
rm -f "${PKG}-${VER}"/3rdPartyLicenses.txt
rm -rf "${PKG}-${VER}"/WinFileIconExport
rm -rf "${PKG}-${VER}"/ant
rm -rf "${PKG}-${VER}"/build
rm -rf "${PKG}-${VER}"/dev_libs
rm -rf "${PKG}-${VER}"/dist
rm -rf "${PKG}-${VER}"/ide
rm -rf "${PKG}-${VER}"/libs
rm -rf "${PKG}-${VER}"/themes
rm -rf "${PKG}-${VER}"/src/org/appwork/utils/swing/windowmanager/MacWindowManager.java
rm -rf "${PKG}-${VER}"/src/org/appwork/swing/synthetica
rm -f "${PKG}-${VER}"/.git*

tar -cJf "${ORIG_TARBALL}" --exclude-vcs "${PKG}-${VER}" || exit 1

rm -rf "${PKG}-${VER}"
rm -f "${ZIPFILE}"

