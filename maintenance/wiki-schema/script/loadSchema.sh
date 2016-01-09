#!/bin/bash

for i in $( less numb3.txt )
do 
echo "-- WORKING ON: wikipedia version $i --"
mysql -u $1 --password=$2 wikipedia_$i < ../schemata/v$i.sql
echo " ---- ---- ----- ---- ----- ----- ---- "
echo ""
done
