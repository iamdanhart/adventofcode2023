#!/bin/zsh

__year=2022

if [ "${1}" != "" ]; then
    padded=$(printf "%02g" ${1})
    mkdir -p swift/${padded}
    touch swift/${padded}/testinput.txt
    if [ ! -f "swift/${padded}/input.txt" ]; then
        curl -s \
            -H "Cookie: session=`cat cookie.txt`" https://adventofcode.com/${__year}/day/${1##0}/input > "swift/${padded}/input.txt"
    fi
    #if [ ! -f "${padded}/main.go" ]; then
    #    cp -n main.go.tmpl ${padded}/main.go
    #fi
    echo "https://adventofcode.com/${__year}/day/${1}"
fi
