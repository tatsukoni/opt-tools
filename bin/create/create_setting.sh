#!/bin/bash

# usage
alreadyExist () {
    echo "$settingFile is already exist."
    exit 1
}

# read config
cd $(dirname $0)
source ../../etc/setting.conf
settingPath=$SETTING_PATH
settingFile=$SETTING_FILE_NAME

# execute
echo "start to create setting file"
cd $settingPath
if [ -f $settingFile ]; then
    alreadyExist
fi

# create
touch $settingFile
chmod 644 $settingFile
# too see https://qiita.com/kite_999/items/e77fb521fc39454244e7
cat <<EOF >> $settingFile
## vscode > 導入している拡張プラグイン

tag || tool

EOF
echo "success to create setting file"
