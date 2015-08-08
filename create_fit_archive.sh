#!/bin/zsh
#arguments: <svnurl> <packagename>

svnurl=$1
archivename=$2

svn co $svnurl histfitter_code
oldpwd=$PWD
cd histfitter_code
find . -iname ".svn" |xargs rm -rf 
cd src
make
cd $oldpwd
tar -czvf $archivename histfitter_code
rm -rf histfitter_code
