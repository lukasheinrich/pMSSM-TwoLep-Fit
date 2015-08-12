#!/bin/zsh 
#arguments workdir inputfile outputfile codearchive

workdir=$1
inputfile=$2
outputfile=$3
codearchive=$4

mkdir $workdir
tar -C $workdir -xzvf $codearchive

cd $workdir/histfitter_code

echo "input file for fit is: $inputfile"

./luke_run_limit.sh $inputfile $outputfile
cd ../../
rm -rf $workdir
