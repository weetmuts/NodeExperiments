#!/bin/bash

PWD=$(pwd)
BIN=$PWD/node_modules/.bin

if [ ! -d "$BIN" ]
then
    echo The node_modules/.bin directory does not exist!
    echo Please run: ./configure
fi

if [[ $PATH == *"$BIN"* ]]
then
    echo "Already loaded shell envs."
else
    export PATH=./node_modules/bin:$PATH
fi
