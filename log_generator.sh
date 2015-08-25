#!/bin/bash

array=(smbd nfs webdav ftp scp)

while true
do
        #generate some fake events
        serverName=`echo "server-$[ ( $RANDOM % 10 )  + 1 ]"`
        sourceIP=`dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tu1 | sed -e 's/^ *//' -e 's/  */./g'`
        dialog=$(( $(od -An -N2 -i /dev/random)%5 ))
        #log to /var/log/messages
        logger "${sourceIP} -> ${serverName} url=http://${sourceIP}/${serverName}"
        logger "${sourceIP} -> ${serverName} dialog=${array[$dialog]}"
        sleep 3
done
