#get saved session names and ip addresses
grep address: -r ~/Library/Application\ Support/CoRD/Servers/ |sed "s/.*\///g" |sed "s/:full\ address:s:/|/g" | sed "s/.rdp//g"> list.txt