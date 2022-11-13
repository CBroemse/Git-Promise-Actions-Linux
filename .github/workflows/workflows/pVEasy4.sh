#!/bin/bash
# USAGE:
# e.g *> ./pVEasy4.sh 100 5 121 aDict1.sh
variable=$1;
var3=$3
var4= var1=$variable; var2="$variable"; gawk "BEGIN {OFMT=\"%.8f\"; print $var1 /100*$2+ $var2;}"
var5=$(gawk "BEGIN {OFMT=\"%.8f\"; print $var1 /100*$2+ $var2;}")

var6=$(gawk "BEGIN {OFMT=\"%.8f\"; print $var1 - $var2 /100*$2;}")
<<COMMENT
    var1 = $1 = ACTION's initial value
    var2 = $2 = VARIANCE percentage of var1
    var3 = $3 = PROPOSITION another value
           $4 = source file e.g aDict1.sh
    var4 = print var1 && var2
    var5 = variance upper limit
    var6 = variance lower limit
COMMENT
touch test.sh
#echo $var3
echo $var6 
echo $1 1> test.sh
echo $var5 >> test.sh
echo $var6 >> test.sh
#touch aDict1.sh
echo $1 $var5 $var6 #$(paste test.sh $var1)
if [ $var3 '<' $var5 ] && [ $var3 > $var6 ]
then
   echo "Variance within boundaries"
   echo "will add to list"
   echo $1 $var5 $var6 >> aDict1.sh #$(paste test.sh $var1)
else
   echo rejected creates a NOTHING
   echo value is more than $2 % different
fi
#echo "$varianceup"
