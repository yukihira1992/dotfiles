#! /bin/bash

grep -q fish /etc/shells
if [ $? -ne 0 ] ; then
    echo "$(which fish)" | sudo tee -a /etc/shells
fi

chsh -s "$(which fish)"

exit 0

