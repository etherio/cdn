#!/bin/bash
BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

delete_tmp() {
    cp $BIN/../tmp/.gitignore $BIN/../.e0e89e8ur.tmp
    echo -ne "[-] \e[0;34mDeleting all files in 'tmp' directory.\e[0m\r"
    rm -rf $BIN/../tmp
    echo -e  "[+] \e[0;32mRemoved!                              \e[0m"
    mkdir $BIN/../tmp && mv $BIN/../.e0e89e8ur.tmp $BIN/../tmp/.gitignore
}

delete_lib() {
    cp $BIN/../docs/.gitkeep $BIN/../.a98ruj32e.tmp
    echo -ne "[-] \e[0;34mDeleting all files in 'lib' directory.\e[0m\r"
    rm -rf $BIN/../docs
    echo -e  "[+] \e[0;32mRemoved!                              \e[0m"
    mkdir $BIN/../lib && mv $BIN/../.a98ruj32e.tmp $BIN/../lib/.gitkeep
}

delete_tmp

if [ ! $1 ]
then
    exit
fi

if [ $1 = '-a' ]
then
    delete_lib
fi

if [ $1 = '--all' ]
then
    delete_lib
fi
