#!/usr/bin/env bash

RELEASES=( "pub_0.10::nodejs:Node.js 0.10"
           "pub_0.10:_0.10:nodejs:Node.js 0.10"
           "pub_0.12:_0.12:nodejs:Node.js 0.12"
           "pub_iojs_1.x:_iojs_1.x:iojs:io.js 1.x"
           "pub_iojs_2.x:_iojs_2.x:iojs:io.js 2.x"
         )
SOURCE=_setup.sh
DEST=../setup

for release in "${RELEASES[@]}"; do
    repo=${release%%:*}
    suffix=$(echo $release | cut -d: -f2)
    package=$(echo $release | cut -d: -f3)
    name=$(echo $release | cut -d: -f4)
    cat $SOURCE \
      | sed 's/{{repo}}/'"$repo"'/g;s/{{suffix}}/'"$suffix"'/g;s/{{name}}/'"$name"'/g;s/{{package}}/'"$package"'/g' \
      > ${DEST}${suffix}
done
