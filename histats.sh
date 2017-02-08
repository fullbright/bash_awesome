#!/bin/bash

set -e

function histats2 {
        #echo history > myhistats.txt
        history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
        #cat myhistats.txt | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

RECIPIENT="full3right@gmail.com"
HOST=$(hostname)
WEEKNUMBER=$(/bin/date +%V)

echo "Grab the history stats"
#EMAILCMD=$(history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10)
#EMAILCMD=history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
EMAILCMD=history
#history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10 > myhistats2.txt
#EMAILBODY="$(cat myhistats2.txt)"

echo $EMAILCMD

EMAILBODY="$(cat ~/.bash_history | awk '{CMD[$1]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10)"


SUBJECT="$HOST - History stats - week $WEEKNUMBER"

echo "RECIPIENT : $RECIPIENT"
echo "BODY : $EMAILBODY"
echo "SUBJECT: $SUBJECT"
echo "End"

curl -s --user 'api:key-44faoj5x2z0nbxz3r08todivhnh17261' https://api.mailgun.net/v3/mailgun.bright-softwares.com/messages -F from='History stats <mailgun@mailgun.bright-softwares.com>' -F to="$RECIPIENT" -F subject="$SUBJECT" -F text="$EMAILBODY"
