#!/bin/bash

# usage
notEnoughAugument () {
    echo "need 1 augument 'tag'."
    exit 1
}
alreadyRegister () {
    echo "$1 is already registered tag"
    exit 1
}

tag=$1
if [ -z $tag ]; then
    notEnoughAugument
fi

# execute
echo "start register tag. tag: $tag"
cd $HOME/Desktop/memo/tool/editor/vscode/
# judge tag
for registered_tag in `sed '1,2d' register_tag.txt`
do
    if [ $tag = $registered_tag ]; then
        alreadyRegister $tag
    fi
done
# register
echo $tag >> register_tag.txt
echo 'success to register.'
