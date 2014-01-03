#!/bin/bash - 
#===============================================================================
#
#          FILE: rrm.sh 
# 
#         USAGE:  ./rrm.sh foo
# 
#   DESCRIPTION:  e.g. ./rrm.sh .svn  // delete all .svn folders recursive.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  bigdog()
#       COMPANY: 
#       CREATED: 2012/06/07 15时52分04秒 CST
#      REVISION:  ---
#===============================================================================
set -o nounset                              # Treat unset variables as an error

function usage () {
    echo -ne "\n`basename $0`, a small tool, be used for recursivly delete specified file or folder.\n"
    echo -ne "\nUsage :\n"
    echo -ne "\t `basename $0` filename [ or foldername ]\n"
    echo -ne "\n\t `basename $0` .svn   < will be delete all .svn folder> \n\n"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi 

echo -e "\n+------------------------------------------------------------------+"
find ./ -name "$1" | grep "$1$"
echo -e "+------------------------------------------------------------------+\n"

echo -ne "\nThe files listed above will be delete.\n\n"

read -p "Continue ? [Y/N] : " answer

if [ $answer != "y" -a $answer != "Y" ]; then
    echo -e "\nExit\n"
    exit 0
fi

find ./ -name "$1" | grep "$1$" | sed -e 's/^/rm -rf /g' | /bin/bash

echo -e "\nSuccess\n"
exit 0
