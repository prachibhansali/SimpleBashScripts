#!/bin/bash

cd $1
folder[0]="WordCountNoCombiner"
folder[1]="WordCountSiCombiner"
folder[2]="WordCountPerMapTally"
folder[3]="WordCountPerTaskTally"
mkdir Outputs
cd Outputs

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for str in part-r-00000* part-r-00001* part-r-00002* part-r-00003* _SUCCESS* part-r-00004*; do
	i=0
	for file in `ls -rt /Users/prachibhansali/Downloads/$str`; do
		if [ ! -d  "${folder[i]}" ]; then
			 mkdir ${folder[i]}					
		fi
		echo ${file}
		mv $file ${folder[i]} 
		((i++))
	done
done	

cd ..

for str in *syslog* *controller* *stdout*; do
        i=0
        for file in `ls -rt /Users/prachibhansali/Downloads/$str`; do
                if [ ! -d  "${folder[i]}" ]; then
                         mkdir ${folder[i]}
                fi
                mv $file ${folder[i]}       
                ((i++))
        done
done       
IFS=$SAVEIFS

