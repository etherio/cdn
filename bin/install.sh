#!/bin/bash
set -e
echo

BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT="$( cd "$BIN/../" >/dev/null 2>&1 && pwd )"
TEMP="$ROOT/tmp"
LIST="$ROOT/sources"

if [ ! $1 ]
then
    echo -e "\e[1;31m[ERROR] Require Argument.\e[m" 
    exit
fi

if [ ! $2 ]
then
    BRANCH="master"
else
    BRANCH="$2"
fi

REPOSITORY="$( cat $LIST | grep "^$1\s" | cut -d ' ' -f 2 )"

if [ ! $REPOSITORY ]
then
    echo -e "\e[1;31m[ERROR] Package '$1' not found.\e[m" 
    exit
fi

PACKAGE=https://codeload.github.com/$REPOSITORY/zip/$BRANCH
ZIP_FILE="$TEMP/$1.zip"
SRC_DIR="$TEMP/$1-$BRANCH"

if [ -d $SRC_DIR ]
then
    echo -e "\e[1;34m$REPOSITORY@$BRANCH\e[0;37m already existed.\e[0m"
    exit
fi

echo -ne "[-] \e[0;36mDownloading \e[1;4;36m$REPOSITORY@$BRANCH\e[0m\r"
curl -G -L -s -o $ZIP_FILE --url $PACKAGE
echo -e  "[+] \e[0;32mDownloaded  \e[1;4;36m$REPOSITORY@$BRANCH\e[0m"

echo -ne "[-] \e[0;36mUnzipping   \e[1;4;36m$1.zip\e[0m\r"
cd $TEMP && unzip -o -qq $ZIP_FILE
echo -e  "[+] \e[0;32mUnzipped    \e[1;4;36m$1.zip\e[0m"

echo -ne "[-] \e[0;36mRemoving    \e[1;4;36m$1.zip\e[0m\r"
rm $ZIP_FILE
echo -e  "[+] \e[0;32mRemoved     \e[1;4;36m$1.zip\e[0m"
echo 
exit