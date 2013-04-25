#!/bin/sh

#Case-insensitive matching
shopt -s nocasematch

#Create RDP list
./createlist.sh

#Alfred argument ({query})
search="$1"

echo '<?xml version="1.0"?>
<items>'

while read line
do
	IFS="|" #Change Internal File Separator
	data=($line) #define massive
	Sname="${data[0]}"
	Sip="${data[1]}"
if [ "$Sname" == "$search"* ] || [ "$Sip" == "$search"*]; then
echo '<item uid="'$Sname'" arg="'$Sname'" valid="yes" type="file">
	<title>'$Sname'</title>
	<subtitle>'$Sip'</subtitle>
	<icon>icon.png</icon>
	</item>'
fi	
done < list.txt

echo '</items>'

