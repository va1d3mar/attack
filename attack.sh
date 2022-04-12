echo "--==" "$(date "+%d.%m.%Y %H:%M:%S")" "==--" "Starting attack. Putin, go to HELL!!!" >> /var/log/attack.log
while true 
do
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Starting sequence" >> /var/log/attack.log & $1 & echo "$(date "+%d.%m.%Y %H:%M:%S")" "Sequence active, working for 15 minutes" >> /var/log/attack.log & sleep 15m && echo "$(date "+%d.%m.%Y %H:%M:%S")" "Restarting after 15 minutes of work" >> /var/log/attack.log && systemctl restart docker
echo "$(date "+%d.%m.%Y %H:%M:%S")" "DOCKER restarted. Waiting 5 secounds for new sequence" >> /var/log/resting.log
sleep 5
done