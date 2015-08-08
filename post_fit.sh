#/bin/zsh
#postfit script to get format correct: args: <fitarchive> <workdir> <modelName> <outputfile>

archive=$1
workdir=$2
modelName=$3
outputfile=$4

mkdir $workdir
tar -C $workdir -xzvf $archive &> /dev/null

SR_names=(SR-WWa SR-WWb SR-WWc SR-mT2a SR-mT2b SR-mT2c SR-Zjets)

(for x in 0 1 2 3 4 5 6;do 
  obs_exp=$(cat $workdir/pvalue_"$x".log|grep "CLs[e:]"|awk '{print $3}'|tr "\n" ","|xargs echo|sed 's|,$||')
  echo "${SR_names[$x]}:" "["$modelName,$obs_exp"]"
done) >  $outputfile
rm -rf $workdir
