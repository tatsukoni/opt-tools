#!/bin/bash

# usage
notEnoughAugument () {
    echo "need at least 2 auguments 'tag' 'tool' (link)."
    exit 1
}
notRegisterTag () {
    echo "$1 is not registered tag. You need to register tag before using."
    exit 1
}

tag=$1
tool=$2
link=$3

if [ ! $# -ge 2 ]; then
    notEnoughAugument
fi

# execute
echo "start add settings. tag: $tag, tool: $tool"
cd $HOME/Desktop/memo/tool/editor/vscode/
# if tag is not registered, proccess is not execured.
count=0
for registered_tag in `sed '1,2d' register_tag.txt`
do
    if [ $tag = $registered_tag ]; then
        let count=count+1
    fi
done

if [ $count -eq 0 ]; then
    notRegisterTag $tag
fi
# add setting.
echo "$tag || $tool ($link)" >> setting.txt
echo 'success to add settings.'
