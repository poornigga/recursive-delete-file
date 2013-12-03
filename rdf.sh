#!/bin/bash - 
#===============================================================================
#
#          FILE: rdf.sh 
# 
#         USAGE:  ./rdf.sh foo
# 
#   DESCRIPTION:  e.g. ./rdf.sh .svn  // delete all .svn folders recursive.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  BigDog
#       COMPANY: 
#       CREATED: 2012/06/07 15时52分04秒 CST
#      REVISION:  ---
#===============================================================================
set -o nounset                              # Treat unset variables as an error


if [ $# = 1 ] ; then
	echo ` find ./ -name "$1" | grep "$1$" `
	ct=` find ./ -name "$1" | grep "$1$" | wc -l `
	echo -ne "\n\n---->$ct  File(s) Will Be Delete \n\n"
	find ./ -name "$1" | grep "$1$" | sed -e 's/^/rm -rf /g' | /bin/sh
else
	echo -ne " \n\tUsage : $0 filename|dirname \n\n\t\t etc  : $0 .svn \n\n"
fi
