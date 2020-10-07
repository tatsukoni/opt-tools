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

# too see https://qiita.com/koara-local/items/2d67c0964188bba39e29
cd $(dirname $0)
source ../etc/setting.conf
settingPath=$SETTING_PATH

tag=$1
tool=$2
link=$3

if [ ! $# -ge 2 ]; then
    notEnoughAugument
fi

# execute
echo "start add settings. tag: $tag, tool: $tool"
cd $SETTING_PATH
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
serialNumber=`sed '1,4d' setting.txt | cut -d: -f 1 | sort -n | tail -n 1`
let serialNumber=serialNumber+1
echo "$serialNumber: $tag || $tool ($link)" >> setting.txt
echo 'success to add settings.'
