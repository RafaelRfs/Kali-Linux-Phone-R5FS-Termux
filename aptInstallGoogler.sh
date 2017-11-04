echo "[+]Installing Googler..."
sudo add-apt-repository ppa:twodopeshaggy/jarun
sudo apt-get install googler
sudo curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v3.3/googler && sudo chmod +x /usr/local/bin/googler
sudo googler -u
echo "[+]Googler Install Complete...Example: googler hello world "
