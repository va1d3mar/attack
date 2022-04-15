echo "Розпочинаємо процедуру інсталяції"
if [ whoami != 'root' ];
then 
	echo "Треба це робити під root!" && break
else
	apt update
	apt install apt-transport-https ca-certificates curl software-properties-common tmux nano nload git -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	apt update
	apt-cache policy docker-ce
	apt install docker-ce
	clear
	echo "Інсталяцію пакетів завершено, починаю завантаження скриптів атаки"
	git clone https://github.com/va1d3mar/attack.git
	cd attack
	ls
	echo "^ ^ ^ Ось файли, з якими потрібно працювати ^ ^ ^"
	echo "readme.txt тут не просто так, бажано ознайомитися"
fi
