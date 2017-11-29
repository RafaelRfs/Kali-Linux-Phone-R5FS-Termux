echo "[...]Installing Apps..."
echo deb http://http.kali.org/kali kali-bleeding-edge main contrib non-free >> /etc/apt/sources.list.d/kali-bleeding-edge.list
dpkg --add-architecture i386
apt update
apt --fix-broken install
apt -y upgrade
apt install -y  net-tools zsh fail2ban aide php sudo php-curl python python-pip python3-pip postgresql postgresql-contrib ftp-ssl iptables ettercap-text-only sslstrip dsniff bluetooth
pip install scapy
pip install python-nmap sqlmap colorama PyX requests setuptools urllib3 wifi
pip3 install BeautifulSoup colorama pycparser six urllib3 wifi youtube-dl
apt install -y metasploit-framework
