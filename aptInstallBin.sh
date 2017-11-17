bin_dir=/usr/bin/
echo "[+]Installing System binaries..."
chmod 777 -R *
cat iptab.sh > ${bin_dir}iptab
chmod 777 ${bin_dir}iptab
cat setEtr.sh > ${bin_dir}setEtr
chmod 777 ${bin_dir}setEtr
mv Client $bin_dir
mv Server $bin_dir
mv mit $bin_dir
mv network $bin_dir
mv network-nmap $bin_dir
mv verser $bin_dir
mv screenfet $bin_dir
mv nmp $bin_dir
mv ngrok $bin_dir
echo "[...]Complete..."
