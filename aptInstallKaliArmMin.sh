bin_dir=/data/data/com.termux/files/home/kali-armhf/
echo "[+]Installing Kali Arm 32 Minimal Version..."
echo
apt install proot wget tar -y
echo "Now Kali Nethunter Is Installing......."
echo
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz
echo
proot --link2symlink tar -xf kalifs-armhf-minimal.tar.xz
cd kali-armhf && echo "nameserver 8.8.8.8" > etc/resolv.conf
cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b ${bin_dir}sys/ -b /dev/ -b /proc/ -b ${bin_dir}root -b ${bin_dir}system -b ${bin_dir}mnt /usr/bin/env -i HOME=${bin_dir}root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM /bin/bash --login" > kali_net.sh
chmod 777 kali_net.sh && termux-fix-shebang kali_net.sh
cat kali_net.sh > /data/data/com.termux/files/usr/bin/kali
chmod 777 /data/data/com.termux/files/usr/bin/kali
echo "[...]Start Kali with: ./kali_net.sh or kali"
