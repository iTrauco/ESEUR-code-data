#!/bin/bash
for i in $( less numb3.txt )
do
echo "CREATE DATABASE IF NOT EXISTS wikipedia_$i;" >> temp.sql
done 
mysql -u $1 --password=$2 < temp.sql
rm temp.sql
