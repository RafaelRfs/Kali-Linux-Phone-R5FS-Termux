echo "[+]Installing Kali Arm 64 Complete version.........."
apt install proot wget tar -y
echo "installed successfully.... :D"
echo "Now Kali Nethunter Phone Hacker  Is Installing......."
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-minimal.tar.xz
proot --link2symlink tar -xf kalifs-arm64-minimal.tar.xz
cd kali-arm64 && echo "nameserver 8.8.8.8" > etc/resolv.conf
cd ../ && echo "proot --link2symlink -0 -r kali-armhf64 -b /dev/ -b /data/data/com.termux/files/home/kali-armhf64/sys/ -b /proc/ -b /data/data/com.termux/files/home/kali-armhf64/root -b /data/data/com.termux/files/home/kali-armhf64/system -b /data/data/com.termux/files/home/kali-armhf64/mnt /usr/bin/env -i HOME=/data/data/com.termux/files/home/kali-armhf64/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM /bin/bash --login" > kali.sh
chmod 777 kali.sh && termux-fix-shebang kali.sh
cat kali.sh > /data/data/com.termux/files/usr/bin/kali
chmod 700 /data/data/com.termux/files/usr/bin/kali
echo "[...]Start Kali with: ./kali.sh or kali"
