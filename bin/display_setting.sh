#!/bin/bash

usage () {
    echo "display setting or tag."
    echo "If you want to display tag, please specify an argument'-t'."
    echo "If you want to display setting, do not specify any arguments."
    exit 0
}

cd $(dirname $0)
source ../etc/setting.conf
settingPath=$SETTING_PATH
settingFile=$SETTING_FILE_NAME
registerTagFile=$REGISTER_TAG_FILE_NAME

DISPLAY_TYPE='setting'
# to see https://qiita.com/b4b4r07/items/dcd6be0bb9c9185475bb
while getopts th OPT
do
    case $OPT in
        t)  DISPLAY_TYPE='tag'
            ;;
        h)  usage
            ;;
        *) usage
            ;;
    esac
done

# display settings.
cd $settingPath
if [ $DISPLAY_TYPE = 'setting' ]; then
    sed '1,2d' $settingFile
elif [ $DISPLAY_TYPE = 'tag' ]; then
    sed '1,2d' $registerTagFile
else
    usage
fi
