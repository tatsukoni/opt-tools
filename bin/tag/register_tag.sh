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

cd $(dirname $0)
source ../../etc/setting.conf
settingPath=$SETTING_PATH
registerTagFile=$REGISTER_TAG_FILE_NAME

tag=$1
if [ -z $tag ]; then
    notEnoughAugument
fi

# execute
echo "start register tag. tag: $tag"
cd $settingPath
# judge tag
for registered_tag in `sed '1,2d' "$registerTagFile"`
do
    if [ $tag = $registered_tag ]; then
        alreadyRegister $tag
    fi
done
# register
echo $tag >> $registerTagFile
echo 'success to register.'
