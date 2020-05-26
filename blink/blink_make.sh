#!/usr/bin/env bash
# http://miniblink.net
# https://github.com/weolar/miniblink49
# node.dll > blink32.dll
# miniblink_x64.dll > blink64.dll

set -e

SCRIPT=`dirname $0`
cd ${SCRIPT}
ROOT=`pwd`

cp blink32.dll blink.dll
upx blink.dll
go-bindata --nocompress -o blink_386.go -pkg blink ./blink.dll

cp blink64.dll blink.dll
upx blink.dll
go-bindata --nocompress -o blink_amd64.go -pkg blink ./blink.dll

rm blink.dll