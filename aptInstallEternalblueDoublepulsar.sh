echo "[+]Instalando o EternalBlue Doublepulsar no Metasploit..."
git clone https://github.com/ElevenPaths/Eternalblue-Doublepulsar-Metasploit
cd Eternalblue-Doublepulsar-Metasploit
chmod 777 eternalblue_doublepulsar.rb 
mv eternalblue_doublepulsar.rb /usr/share/metasploit-framework/modules/exploits/windows/smb/
