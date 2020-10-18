#!/bin/bash

# usage
notEnoughAugument () {
    echo "need 1 augument 'tag'."
    exit 1
}
notExistTag () {
    echo "$1 is not exist."
    exit 2
}

cd $(dirname $0)
source ../../etc/setting.conf
settingPath=$SETTING_PATH
registerTagFile=$REGISTER_TAG_FILE_NAME

targetTag=$1
if [ -z $targetTag ]; then
    notEnoughAugument
fi

# execute
echo "start delete tag. targetTag: $targetTag"
cd $settingPath

# judge tag
if [ -z `grep "$targetTag" "$registerTagFile"` ]; then
    notExistTag $targetTag
fi

# delete target tag
targetDeleteLine=`nl -b a "$registerTagFile" | grep "$targetTag" | cut -f 1`
echo -n "start to delete tag:$targetTag. Are you OK? y/n"
read answer
if [ $answer = 'y' ]; then
    cat $registerTagFile | sed "$targetDeleteLine"'d' > tmp_register_tag.txt
    rm -f $registerTagFile
    mv tmp_register_tag.txt $registerTagFile
    echo "success to delete register tag."
else
    echo "not executed."
fi
