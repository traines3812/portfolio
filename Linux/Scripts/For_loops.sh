#!/bin/bash

states=('Texas' 'Kentucky' 'Tennessee' 'NewYork' 'Massachusetts')

for state in "${states[@]}"
do
	if [ "$state" == 'Massachusetts' ]
then
	echo "GO MASS!" 
else
	echo "Is anything good in Massachusetts?"
fi
done

nums=$(seq 0 9)
for num in ${num[@]}
do
	if [ $num -eq 3 ] || [ $num -eq 5 ] || [ $num -eq 7 ] 
	then
		echo $num
	fi
done
