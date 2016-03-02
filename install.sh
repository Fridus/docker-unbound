#/usr/bin/env bash

set -e

VERSION=${UNBOUND_VERSION:-1.5.8}

_TMP_INSTALL_PATH="/tmp/unbound-install-dir"

printblue() {
  printf "\033[0;34m$1\033[0m"
}

printblue "\nInstall dependencies...\n"
apt-get -qq update && \
apt-get install -y python2.7-dev python swig libevent-dev libexpat-dev libssl-dev make

printblue "\nDownload unbound ${VERSION}...\n"
mkdir -p $_TMP_INSTALL_PATH && cd $_TMP_INSTALL_PATH
wget --quiet http://www.unbound.net/downloads/unbound-${VERSION}.tar.gz
tar -xf unbound-${VERSION}.tar.gz
cd unbound-${VERSION}

printblue "\nConfigure...\n"
./configure \
  --prefix=/usr \
  --sysconfdir=/etc \
  --disable-rpath \
  --with-pidfile=/var/run/unbound.pid \
  --with-libevent \
  --with-pythonmodule \
  --with-pyunbound

printblue "\nBuild and install...\n"
make && make install

printblue "\nAdd user...\n"
useradd unbound

#printblue "\n unbound-anchor...\n"
#unbound-anchor -a /etc/unbound/root.key

printblue "\nUnbound control setup\n"
unbound-control-setup

printblue "\nRemove temp directory\n"
rm -rf $_TMP_INSTALL_PATH

exit 0
