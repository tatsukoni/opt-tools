#!/bin/bash

cd $(dirname $0)
source ../etc/setting.conf
settingPath=$SETTING_PATH

# display settings.
cd $settingPath
sed '1,2d' setting.txt
