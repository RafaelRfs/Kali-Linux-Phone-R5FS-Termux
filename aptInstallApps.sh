echo "[...]Installing Apps..."
apt update
apt --fix-broken install
apt -y upgrade
apt install -y  net-tools php php-curl python python-pip python3-pip postgresql postgresql-contrib
pip install scapy
apt install metasploit-framework
