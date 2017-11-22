echo "##############################################"
echo " Phone Hacker Lv 2 Kali Nethunter R5FS ~> Termux"
echo "##############################################"
echo "______________________________________________"
echo "[+]Setting the Termux Kali..."
echo "______________________________________________"
apt update
apt -y --fix-broken install
apt upgrade
apt install -y dos2unix net-tools
dos2unix *.sh
chmod 777 -R *
./aptInstallBin.sh
./aptInstallApps.sh
./aptInstallGoogler.sh
./aptInstallWine32.sh
echo "[...]Installation Complete..."
screenfet
sleep 5
echo "##############################################"
echo "[+]PHONE-HACKER LV.2 Success"
echo "##############################################"
