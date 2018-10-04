#!/usr/bin/env bash

for d in */ ; do
    echo "------------------------------------"
    echo "$d"
    cd $d
    ls -LR | grep Test | wc -l
    cd ..
done
