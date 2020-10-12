#!/bin/bash

# usage
alreadyExist () {
    echo "$registerTagFile is already exist."
    exit 1
}

# read config
cd $(dirname $0)
source ../../etc/setting.conf
settingPath=$SETTING_PATH
registerTagFile=$REGISTER_TAG_FILE_NAME

# execute
echo "start to create register tag file"
cd $settingPath
if [ -f $registerTagFile ]; then
    alreadyExist
fi

# create
touch $registerTagFile
chmod 644 $registerTagFile
# too see https://qiita.com/kite_999/items/e77fb521fc39454244e7
cat <<EOF >> $registerTagFile
# vscode register tool tags

EOF
echo "success to create register tag file"
