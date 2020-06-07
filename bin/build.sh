#!/bin/bash
BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT="$( cd "$BIN/../" >/dev/null 2>&1 && pwd )"
TEMP="$ROOT/tmp"
DIST="$ROOT/lib"

$BIN/install.sh jquery
if [ -d $DIST/jquery ]
then
    echo -e ">> \e[1;32m'jquery'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    cd $TEMP/jquery-master && npm run build
    cp -r $TEMP/jquery-master/dist/ $DIST/jquery/.
    echo -e ">> \e[1;32m'jquery'\e[0;36m has been installed.\e[0m"
fi

sh $BIN/install.sh spectre
if [ -d $DIST/spectre ]
then
    echo -e ">> \e[1;32m'spectre'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    cp -r $TEMP/spectre-master/dist/ $DIST/spectre
    echo -e ">> \e[1;32m'spectre'\e[0;36m has been installed.\e[0m"
fi

sh $BIN/install.sh materialize
if [ -d $DIST/materialize ]
then
    echo -e ">> \e[1;32m'materialize'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    cp -r $TEMP/materialize-master/dist/ $DIST/materialize
    echo -e ">> \e[1;32m'materialize'\e[0;36m has been installed.\e[0m"
fi


sh $BIN/install.sh milligram
if [ -d $DIST/milligram ]
then
    echo -e ">> \e[1;32m'milligram'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    npm install --global sass
    mkdir $DIST/milligram
    sass "$TEMP/milligram-master/src/milligram.sass" > $DIST/milligram/milligram.css
    echo -e ">> \e[1;32m'milligram'\e[0;36m has been installed.\e[0m"
fi

sh $BIN/install.sh semantic
if [ -d $DIST/semantic ]
then
    echo -e ">> \e[1;32m'semantic'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    mkdir $DIST/semantic
    cp $TEMP/Semantic-UI-CSS-master/semantic.js $DIST/semantic/
    cp $TEMP/Semantic-UI-CSS-master/semantic.css $DIST/semantic/
    cp $TEMP/Semantic-UI-CSS-master/semantic.min.js $DIST/semantic/
    cp $TEMP/Semantic-UI-CSS-master/semantic.min.css $DIST/semantic/
    cp -r $TEMP/Semantic-UI-CSS-master/themes/ $DIST/semantic/themes
    echo -e ">> \e[1;32m'semantic'\e[0;36m has been installed.\e[0m"
fi
