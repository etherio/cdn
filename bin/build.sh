#!/bin/bash
BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT="$( cd "$BIN/../" >/dev/null 2>&1 && pwd )"
TEMP="$ROOT/tmp"
DIST="$ROOT/docs"

if [ -d $DIST/jquery ]
then
    echo -e ">> \e[1;32m'jquery'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    $BIN/install.sh jquery
    cd $TEMP/jquery-master && npm run build
    mkdir $DIST/jquery
    cp -r $TEMP/jquery-master/dist/** $DIST/jquery
    echo -e ">> \e[1;32m'jquery'\e[0;36m has been installed.\e[0m"
fi

if [ -d $DIST/spectre ]
then
    echo -e ">> \e[1;32m'spectre'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    sh $BIN/install.sh spectre
    cp -r $TEMP/spectre-master/dist/ $DIST/spectre
    echo -e ">> \e[1;32m'spectre'\e[0;36m has been installed.\e[0m"
fi

if [ -d $DIST/materialize ]
then
    echo -e ">> \e[1;32m'materialize'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    sh $BIN/install.sh materialize
    cp -r $TEMP/materialize-master/dist/ $DIST/materialize
    echo -e ">> \e[1;32m'materialize'\e[0;36m has been installed.\e[0m"
fi

if [ -d $DIST/milligram ]
then
    echo -e ">> \e[1;32m'milligram'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    sh $BIN/install.sh milligram
    npm install --global sass
    mkdir $DIST/milligram
    sass "$TEMP/milligram-master/src/milligram.sass" > $DIST/milligram/milligram.css
    echo -e ">> \e[1;32m'milligram'\e[0;36m has been installed.\e[0m"
fi

if [ -d $DIST/semantic ]
then
    echo -e ">> \e[1;32m'semantic'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    sh $BIN/install.sh semantic
    mkdir $DIST/semantic
    cp $TEMP/Semantic-UI-CSS-master/semantic.js $DIST/semantic/
    cp $TEMP/Semantic-UI-CSS-master/semantic.css $DIST/semantic/
    cp $TEMP/Semantic-UI-CSS-master/semantic.min.js $DIST/semantic/
    cp $TEMP/Semantic-UI-CSS-master/semantic.min.css $DIST/semantic/
    cp -r $TEMP/Semantic-UI-CSS-master/themes/ $DIST/semantic/themes
    echo -e ">> \e[1;32m'semantic'\e[0;36m has been installed.\e[0m"
fi

if [ -d $DIST/normalize ]
then
    echo -e ">> \e[1;32m'normalize'\e[0;36m has been installed.\e[0m"
    echo -e "\e[34mRun 'bin/clear.sh' to clear all cache\e[0m"
else
    sh $BIN/install.sh normalize
    mkdir $DIST/normalize 
    cp $TEMP/normalize.css-master/normalize.css $DIST/normalize/
    echo -e ">> \e[1;32m'normalize'\e[0;36m has been installed.\e[0m"
fi