#!/bin/bash
cd $(dirname $0)

# read config
source ../../etc/lotate.conf
lotatePath=$LOTATE_PATH
lotateLine=$LOTATE_LINE
lotateDeny=$LOTATE_DENY

# execute
for target in `ls "$lotatePath"`
do
    # not execute deny file
    if [ $target = $lotateDeny ]; then
        echo "$target is deny lotate"
        continue
    fi

    # execute lotate
    currentLine=`wc -l "$lotatePath/$target" | tr -d "$lotatePath/$target"`
    if [ $currentLine -ge $lotateLine ]; then
        today=`date +%Y%m%d`
        # change current file
        mv "$lotatePath/$target" "$lotatePath/$today-$target"
        # create new file
        bash ../create/create.sh $target
    else
        echo "not execute"
    fi
done
