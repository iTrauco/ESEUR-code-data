for a in $( ls tab*)
do
b=$( echo $a | sed 's/[^0-9]*//' ) 
mv $a v$b.sql
done
