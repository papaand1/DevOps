# loadwatch.sh - send an alert if uptime > MAXOK
MAXOK=10
recipient=7032092561@tmomail.net
#loadavg=$(uptime | cut -d\   -f11 | cut -d. -f1)
#if [ $loadavg -gt $MAXOK ] ; then
 # echo "Alert: Load avg $(uptime | cut -d\  -f11)"
  #mail -s "Alert: Load avg $(uptime|cut -d\  -f11)" $recipient
#fi

#  mail -s "Alert: Load avg $(uptime | cut -d,  -f4)" $recipient
  mail 7032092561@tmomail.net | echo "test"
 echo "test" |  mail 7032092561@tmomail.net 

exit 0
