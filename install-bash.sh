#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
 
chmod +x $DIR/sg.sh
sudo cp $DIR/sg.sh /usr/local/bin/sg
_alias="alias git=sg"
$_alias
echo $_alias > ~/.bashrc

