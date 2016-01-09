for a in $( less numb3.txt )
do
echo "$a"
wget -q http://svn.wikimedia.org/viewvc/mediawiki/trunk/phase3/maintenance/tables.sql?revision=$a 
done
