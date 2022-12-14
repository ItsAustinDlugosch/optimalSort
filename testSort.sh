#!/bin/bash
rm optimalSort.csv
rm ~/www/Digital\ Portfolio/optimalSort.csv
echo -e "Sort Name,Date and Time,Test Number,Git Branch,Git Hash,Command Line Executed,Text File,Count of Strings,Type of File,Execution Time (real, to nearest ms)" > optimalSort.csv

cd testWords
for order in ordered.txt reverse-ordered.txt random.txt
do
    echo Trying $order... 
    for i in 0 1 2 3 4 5
    do
        let count=10**$i
        echo testing $count numbers
        for j in 1 2 3 4 5
        do
            cat $order | head -n $count > temp.txt
            time=$( TIMEFORMAT=%R; { time cat temp.txt | ../optimalSort > /dev/null; } 2>&1)
            date=$(date +"%D %T")
            file="${order}10e${i}.txt" #fake file for requirement
            echo -e "optimalSort,${date},${j},main,ab2375e83d83e7f873,time ${sort} < ${file} > /dev/null,${file},${count},${order},${time}" >> ../optimalSort.csv       
        done
    done
done
rm temp.txt
cp ../optimalSort.csv ~/www/Digital\ Portfolio/optimalSort.csv
chmod a+rx -R ~/www/Digital\ Portfolio
echo DONE - open optimalSort.csv, or go to your Digital Portfolio/optimalSort.csv to download the file       
echo Change the branch, hash, command, and file name to your liking.
