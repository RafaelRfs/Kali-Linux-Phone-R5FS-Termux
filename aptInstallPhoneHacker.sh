echo "##############################################"
echo " Phone Hacker R5FS ~> Termux/GnuRoot"
echo "##############################################"
echo "______________________________________________"
echo "[+]Setting the Termux Kali..."
echo "______________________________________________"
dir_bin=/usr/bin/
apt update
su -c dos2unix *.sh
su -c chmod 777 *
sleep 5
echo "______________________________________________"
echo "[+]Installing Apps && libs..."
echo "______________________________________________"
./aptInstallApps.sh
./aptInstallBin.sh
sleep 5
echo "______________________________________________"
echo "[+]Installing Python Libs..."
echo "______________________________________________"
./aptInstallPythonLibs.sh   
sleep 5
echo "##############################################"
echo "[+]PHONE-HACKER Success"
echo "##############################################"
