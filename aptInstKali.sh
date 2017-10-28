#!/data/data/com.termux/files/usr/bin/bash

echo "1)arm64/armv8 (64 bit)"
echo "2)arm/armhf/armv7 (32 bit)"
echo "3)64 bit minimal version (try this if option 1 is giving errors)"
echo "4)32 bit minimal version (try this if option 2 is giving errors)"
echo "5)find your architecture"
read aarch
case $aarch in
1)
echo
echo "prerequisites are installing.........."
echo
apt install proot wget tar -y
echo
echo "installed successfully.... :D"
echo
echo "Now Kali Nethunter Is Installing......."
echo
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-full.tar.xz
echo
proot --link2symlink tar -xf kalifs-arm64-full.tar.xz
cd kali-arm64 && echo "nameserver 8.8.8.8" > etc/resolv.conf

cd ../ && echo "proot --link2symlink -0 -r kali-arm64 -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM /bin/bash --login" > startkali.sh

chmod 777 startkali.sh && termux-fix-shebang startkali.sh

cat startkali.sh > /data/data/com.termux/files/usr/bin/kali
chmod 700 /data/data/com.termux/files/usr/bin/kali
echo
echo 
echo "Now You Can Start Kali Linux (Nethunter) By :--> ./startkali.sh or kali"
;;
2)
echo "prerequisites are installing.........."
echo
apt install proot wget tar -y
echo
echo "installed successfully.... :D"
echo
echo "Now Kali Nethunter Is Installing......."
echo
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz
echo
proot --link2symlink tar -xf kalifs-armhf-full.tar.xz
cd kali-armhf && echo "nameserver 8.8.8.8" > etc/resolv.conf

cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM /bin/bash --login" > startkali.sh

chmod 777 startkali.sh && termux-fix-shebang startkali.sh

cat startkali.sh > /data/data/com.termux/files/usr/bin/kali
chmod 700 /data/data/com.termux/files/usr/bin/kali
echo
echo 
echo "Now You Can Start Kali Linux (Nethunter) By :--> ./startkali.sh or kali"
;;
3)
echo
echo "prerequisites are installing.........."
echo
apt install proot wget tar -y
echo
echo "installed successfully.... :D"
echo
echo "Now Kali Nethunter Is Installing......."
echo
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-minimal.tar.xz
echo
proot --link2symlink tar -xf kalifs-arm64-minimal.tar.xz
cd kali-arm64 && echo "nameserver 8.8.8.8" > etc/resolv.conf

cd ../ && echo "proot --link2symlink -0 -r kali-arm64 -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM /bin/bash --login" > startkali.sh

chmod 777 startkali.sh && termux-fix-shebang startkali.sh

cat startkali.sh > /data/data/com.termux/files/usr/bin/kali
chmod 700 /data/data/com.termux/files/usr/bin/kali
echo
echo 
echo "Now You Can Start Kali Linux (Nethunter) By :--> ./startkali.sh or kali"
;;
4)
echo "prerequisites are installing.........."
echo
apt install proot wget tar -y
echo
echo "installed successfully.... :D"
echo
echo "Now Kali Nethunter Is Installing......."
echo
#wget http://download1520.mediafire.com/8bozy2h2rx7g/f63bor2f7f66yvh/kali-armhf.tar.gz 
wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz
echo
proot --link2symlink tar -xf kali-armhf.tar.gz
cd kali-armhf && echo "nameserver 8.8.8.8" > etc/resolv.conf

cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM /bin/bash --login" > startkali.sh

chmod 777 startkali.sh && termux-fix-shebang startkali.sh

cat startkali.sh > /data/data/com.termux/files/usr/bin/kali
chmod 700 /data/data/com.termux/files/usr/bin/kali
echo
echo 
echo "Now You Can Start Kali Linux (Nethunter) By :--> ./startkali.sh or kali"
;;
5)
echo
echo "Your phone architecture is :-"
aarch=`dpkg --print-architecture`
if [ $aarch = "aarch64" ] ; then
echo
echo "bad luck you are using aarch64 so try your luck because it is not personally tested on aarch64..!!"
else
echo
echo $aarch
fi
;;
esac
