#!/bin/bash

set -x

mkdir -p _site/3.0/doc
curl https://raw.githubusercontent.com/ledger/ledger/v3.1.1/doc/ledger3.texi > ledger3.texi
curl https://raw.githubusercontent.com/ledger/ledger/v3.1.1/doc/version.texi.in > version.texi
curl https://raw.githubusercontent.com/ledger/ledger/v3.1.1/doc/ledger.1 > ledger.1
curl https://raw.githubusercontent.com/ledger/ledger-mode/master/doc/ledger-mode.texi > ledger-mode.texi

makeinfo --force --html --no-split -o _site/3.0/doc/ledger3.html ledger3.texi
makeinfo --force --html --no-split -o _site/3.0/doc/ledger-mode.html ledger-mode.texi

texi2pdf -b -V -o _site/3.0/doc/ledger3.pdf ledger3.texi
groff -mandoc -Thtml ledger.1 > _site/3.0/doc/ledger.1.html

texi2pdf -b -V -o _site/3.0/doc/ledger-mode.pdf ledger-mode.texi
