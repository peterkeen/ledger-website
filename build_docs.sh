#!/bin/bash

set -e
set -x

mkdir -p _site/3.0/doc
curl https://raw.githubusercontent.com/ledger/ledger/v3.1.1/doc/ledger3.texi > ledger3.texi
curl https://raw.githubusercontent.com/ledger/ledger/v3.1.1/doc/version.texi.in > version.texi
curl https://raw.githubusercontent.com/ledger/ledger/v3.1.1/doc/ledger.1 > ledger.1

makeinfo --force --html --no-split -o _site/3.0/doc/ledger3.html ledger3.texi
groff -mandoc -Thtml ledger.1 > _site/3.0/doc/ledger.1.html
