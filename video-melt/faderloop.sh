#/bin/bash

# loop over directories and exec fader script

dirs=$(find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n')

for dir in $dirs
do
	echo "process $dir"
	cd $dir
	title=$(cat title.txt)
	nice -5 ~/fader.sh "${title}" ${dir}
	cd ..
done
echo Done
