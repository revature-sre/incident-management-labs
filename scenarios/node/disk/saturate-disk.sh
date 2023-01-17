#!/bin/bash

# This script will increase CPU usage and disk write usage

sudo yum update > /dev/null 2>&1

if [ ! command -v npm > /dev/null 2>&1 ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash > /dev/null
        . ~/.nvm/nvm.sh > /dev/null
        nvm install 16 > /dev/null
fi

wget -q -O app.zip "https://angular.io/generated/zips/toh-pt6/toh-pt6.zip"
unzip app.zip -d ./tour-of-heroes/ > /dev/null
rm app.zip > /dev/null
cd ./tour-of-heroes/

for i in {1..30}
do
        echo `date +"%Y-%M-%d %T"`" - Warning: background service downloading files"
        npm install > /dev/null 2>&1
        rm -rf node_modules/
done

cd ..
rm -rf ./tour-of-heroes/ > /dev/null 2>&1