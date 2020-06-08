#!/bin/bash
echo -n "Input your branch <master>: "
read BRANCH
echo 

if [ "$BRANCH" = "" ]; then
    BRANCH="master"
fi

git add . 2>&1
git commit -m "Auto updated via `bin/update.sh`" 2>&1
git push -u origin $BRANCH 2>&1