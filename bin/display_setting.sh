#!/bin/bash

cd $(dirname $0)
source ../etc/setting.conf
settingPath=$SETTING_PATH
settingFile=$SETTING_FILE_NAME

# display settings.
cd $settingPath
sed '1,2d' $settingFile
