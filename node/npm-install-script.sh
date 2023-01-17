#!/bin/bash

#This script will increase CPU usage and disk write usage

sudo yum update

if ! command -v npm > /dev/null 2>&1; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash > /dev/null
        . ~/.nvm/nvm.sh > /dev/null
        nvm install 16 > /dev/null
fi

wget -O app.zip "https://angular.io/generated/zips/toh-pt6/toh-pt6.zip" > /dev/null

unzip app.zip -d ./tour-of-heroes/ > /dev/null
rm app.zip > /dev/null
cd ./tour-of-heroes/

for i in {1..10}
do
        npm install > /dev/null
        rm -rf ./node_modules 
        echo "Warning: background service downloading files"
        sleep 60
done

cd ..
rm -rf ./tour-of-heroes/
