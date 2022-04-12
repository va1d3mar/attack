
        ____  _     _ _____             ____       
__   __/ __ \/ | __| |___ / _ __ ___   / __ \ _ __ 
\ \ / / / _` | |/ _` | |_ \| '_ ` _ \ / / _` | '__|
 \ V / | (_| | | (_| |___) | | | | | | | (_| | |   
  \_/ \ \__,_|_|\__,_|____/|_| |_| |_|\ \__,_|_|   
       \____/                          \____/      

From year 2022 B.C. till ∞

Need to install before launch:
                              docker
Also will be nice to install:
                              tmux
                              cbm

Use ROOT to launch, not sudo, because systemctl is used inside. 
When you are using sudo it'll brake execution as soon as sudo session expires.
Find logfile at /var/log/attack.log if you need so. Tail -f will give some local lulz.

Don't be afraid to use tmux to easily leave terminal not keeping eye on it.