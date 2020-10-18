#!/bin/bash
cd $(dirname $0)

# usage
notEnoughAugument () {
    echo "need 1 augument 'createFile'."
    exit 1
}
notTargetCreate () {
    echo "$1 is not target to create."
    exit 2
}

# read config
source ../../etc/setting.conf
settingFile=$SETTING_FILE_NAME
registerTagFile=$REGISTER_TAG_FILE_NAME

CREATE_FILE=$1
if [ -z $CREATE_FILE ]; then
    notEnoughAugument
fi

# execute
if [ $CREATE_FILE = $settingFile ]; then
    source ./create_setting.sh
elif [ $CREATE_TYPE = $registerTagFile ]; then
    source ./create_register_tag.sh
else
    notTargetCreate $CREATE_FILE
fi
