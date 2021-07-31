#!/usr/bin/env bash

[[ -d fernflower ]] && rm -rf fernflower
git clone "https://github.com/fesh0r/fernflower.git"
cd fernflower
git submodule init && git submodule update
gradle clean build
ls -alh .
ls -alh ./build
cd ../

[[ -d sk.decompile.fernflower.build ]] && rm -rf sk.decompile.fernflower.build
git clone "https://github.com/ShaneKingCommonweal/sk.decompile.fernflower.build.git"
rm -rf sk.decompile.fernflower.build/build/libs
mkdir -p sk.decompile.fernflower.build/build/libs
cp -r fernflower/build/libs sk.decompile.fernflower.build/build

cd sk.decompile.fernflower.build
git pull
#can not add target...
#git add -A
git add -f .
git add -u
git commit -m "sync at $(date +'%Y-%m-%d %H:%M')"
git push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKingCommonweal/sk.decompile.fernflower.build.git" main:main
