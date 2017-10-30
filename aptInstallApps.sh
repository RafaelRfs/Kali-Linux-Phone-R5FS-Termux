echo "[...]Installing Apps..."
apt update
apt --fix-broken install
apt -y upgrade
apt install -y  net-tools php php-curl python python-pip python3-pip postgresql postgresql-contrib iptables ettercap-text-only sslstrip
pip install python-nmap sqlmap colorama PyX requests setuptools urllib3 scapy wifi
pip3 install BeautifulSoup colorama pycparser six urllib3 wifi youtube-dl
apt install metasploit-framework
