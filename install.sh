  GNU nano 6.2                                       install.sh *                                              
echo "Розпочинаємо процедуру інсталяції"
echo ""
apt update
apt install apt-transport-https ca-certificates curl software-properties-common tmux nano nload git -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
echo ""
echo "Інсталяцію пакетів завершено, починаю завантаження скриптів атаки"
echo ""
rm -rf attack
git clone -b testing https://github.com/va1d3mar/attack.git
cd attack
echo ""
ls
echo "^ ^ ^ Ось файли, з якими потрібно працювати ^ ^ ^"
echo "readme.txt тут не просто так, бажано ознайомитися"
echo ""
echo "Всьо закінчено, можна атакувати"