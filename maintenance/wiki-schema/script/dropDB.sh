#!/bin/bash
for i in $( less numb3.txt )
do
echo "DROP DATABASE IF EXISTS wikipedia_$i;" >> temp.sql
done 
mysql -u $1 --password=$2 < temp.sql
rm temp.sql
