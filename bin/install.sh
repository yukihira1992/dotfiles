#! /bin/sh

if [ "$(uname)" == "Darwin" ]; then
    sh ./platforms/osx/install.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sh ./platforms/linux/install.sh
else
    echo "Unsupported platform."
    exit 1
fi
