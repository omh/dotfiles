#!/bin/bash

FILEPATH="$1"
FILENAME=`basename -s ".tpl" $FILEPATH`
DIRNAME=`dirname $FILEPATH`
# Add a space between every directory so we can traverse it
FILEPATH=`echo $FILEPATH|sed -e "s/\//\/ /g"`

prevdir=""
vardir=""
# traverse path
for dir in $FILEPATH; do
    # we'll traverse the path looking for the ezp root directory.
    # This is done by looking for ezpublish.cron and access.php inside a directory. If found
    # it is very likely that the directory is an ezp installation.
    result=`ls ${prevdir}${dir}ezpublish.cron ${prevdir}${dir}access.php 2>> /dev/null`
    exit_status=$?

    # if exist_status is 0 then we found our ez publish root directory
    if [ $exit_status == 0 ]; then
        vardir="${prevdir}${dir}var"
	    echo "Checking template "
        echo "cd \"${prevdir}${dir}\" && php bin/php/eztemplatecheck.php --no-colors \"$1\""
        cd "${prevdir}${dir}" && php bin/php/eztemplatecheck.php --no-colors "$1"
        break
    fi
    prevdir="${prevdir}${dir}"
done
