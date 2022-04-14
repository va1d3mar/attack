
        ____  _     _ _____             ____       
__   __/ __ \/ | __| |___ / _ __ ___   / __ \ _ __ 
\ \ / / / _` | |/ _` | |_ \| '_ ` _ \ / / _` | '__|
 \ V / | (_| | | (_| |___) | | | | | | | (_| | |   
  \_/ \ \__,_|_|\__,_|____/|_| |_| |_|\ \__,_|_|   
       \____/                          \____/      

From year 2022 B.C. till ∞

Need to install before launch:
                              docker
                              tmux
                              nload

Launching under root only.
bash attack.sh attack 'command' threads &
               change 'command' threads &
               halt

Use & inthe end of command to put execution to background.

If you want to see what is going on: tmux a.
If you want to put tmux to background: Ctrl+b then press 'd'.
If you want to change target put tmux to background at first.
If you want to come back: tmux a.

Log is located at /var/log/attack.log