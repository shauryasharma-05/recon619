#!/bin/bash
echo "                      ___________________________    __   _  ___         "
echo "+++++++++++++++++++++|  _ \| ____/ ___/ _ \| \ | |  / /_ / |/ _ \ "
echo "                     | |_) |  _|| |  | | | |  \| | |  _ \| | (_) |"
echo "                     |  _ <| |__| |__| |_| | |\  | | (_) | |\__  |"
echo "+++++++++++++++++++++|_| \_\_____\____\___/|_| \_|  \___/|_|  /_/       -v1.0 By Shaurya Sharma "
echo
echo
echo Searching for domains!

#installing assetfinder
go get github.com/tomnomnom/assetfinder

#running_assetfinder
assetfinder -subs-only $1 > domains.txt
echo
echo Removing duplicate entries
sort -u domains.txt -o domains.txt
echo
#checking for alive domains
echo "Checking for Live Domains..."
cat domains.txt | ~/go/bin/httprobe > Live.txt

cat Live.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > Live.json

cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > domains.json
sleep 3
echo 'Done!'
