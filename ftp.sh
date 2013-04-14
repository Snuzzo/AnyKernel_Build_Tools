#!/bin/bash -e

. build-config

USERNAME=
PASSWORD=
SERVER=
#  Filename of backup file to be transfered
FILE="$VERSION.zip"
MD5="$VERSION.md5"
# login to ftp server and transfer file
cd $TARGET_DIR
SUM=`md5sum $FILE | cut --delimiter=' ' -f 1`
echo "$SUM" > $MD5
ftp -n -i $SERVER <<EOF
user $USERNAME $PASSWORD
cd $FTPTARGETDIR
binary
mput $FILE
mput $MD5
quit
EOF
