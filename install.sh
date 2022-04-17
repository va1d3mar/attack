  GNU nano 6.2                                       install.sh *                                              
echo "Розпочинаємо процедуру інсталяції"
echo ""
echo "Спочатку оновимо репозиторії"
echo ""
apt update
echo ""
echo "Тепер оновимо систему"
echo ""
atp upgrade -y
echo ""
echo "Настав час встановлення додаткового софту"
echo ""
apt install apt-transport-https ca-certificates curl software-properties-common tmux nano nload git htop docker.io -y
echo ""
echo "Інсталяцію пакетів завершено, починаю завантаження скриптів атаки"
echo ""
cd /etc
rm -rf /etc/attack
git clone -b testing https://github.com/va1d3mar/attack.git
echo ""
echo "alias attack='bash /etc/attack/attack.sh'" >> ~/.bash_aliases
echo "Всьо закінчено, можна атакувати"