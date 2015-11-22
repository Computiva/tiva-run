#! /bin/bash

mkdir -p {"/usr/share/tiva/public keys",/var/log/tiva/output/,/usr/lib/tiva/}
cp bin/* /usr/bin/
cp lib/* /usr/lib/tiva/
cp sudoers.d/* /etc/sudoers.d/
