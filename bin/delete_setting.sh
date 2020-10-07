#!/bin/bash

notEnoughAugument () {
    echo "need 1 auguments 'delete_serial_number'"
    exit 1
}
notExistTarget () {
    echo "not exist $1 target. Please reconfirm!!"
    exit 2
}

cd $(dirname $0)
source ../etc/setting.conf
settingPath=$SETTING_PATH

deleteNumber=$1
if [ $# -ne 1 ]; then
    notEnoughAugument
fi

# execute
echo "start delete settings. delete_serial_number: $deleteNumber"
cd $settingPath
targetDelete=`cat setting.txt | grep "^$deleteNumber: .*"`
if [ -z "$targetDelete" ]; then
    notExistTarget $deleteNumber
fi

# delete target setting.
targetDeleteLine=`nl -b a setting.txt | grep "$targetDelete" | cut -f 1 | sed 's/^ *//g'`
echo -n "start to delete $targetDelete. Are you OK? y/n"
read answer
if [ $answer = 'y' ]; then
    cat setting.txt | sed "$targetDeleteLine"'d' > tmp_setting.txt
    rm -f setting.txt
    mv tmp_setting.txt setting.txt
    echo "success to delete settings."
else
    echo "not executed."
fi
