#!/bin/bash
echo "Executing a bash statement for Crontab"

set -e

#write out current crontab
(crontab -l 2>/dev/null; echo "#Adding Cron")| crontab -
crontab -l > mycron
#echo new cron into cron file
crontab -l | grep -q 'PATH=/usr/local/'  && echo 'entry exists' || echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"  >> mycron
if [ -f /root/Scripts/Metrics.py ]
then
crontab -l | grep -q '/root/Scripts/Metrics.py'  && echo 'entry exists' || echo "* * * * * for i in 0 1 2 3 4 5 ;do  /root/Scripts/Metrics.py & sleep 10 ; done;" >> mycron
fi
if [ -f /root/Scripts/SqlMetrics.py ]
then
crontab -l | grep -q '/root/Scripts/SqlMetrics.py '  && echo 'entry exists' || echo "* * * * * for i in 0 1 2 3 4 5 ;do  /root/Scripts/SqlMetrics.py & sleep 10 ; done;"  >> mycron
fi
#install new cron file
crontab mycron
rm mycron

