wget https://bin.equinox.io/a/nmkK3DkqZEB/ngrok-2.2.8-linux-arm64.zip
unzip ngrok-2.2.8-linux-arm64.zip
rm ngrok-2.2.8-linux-arm64.zip
cat ngrok > ~/../usr/bin/ngrok
rm ngrok
chmod 777 ~/../usr/bin/ngrok
ngrok authtoken $1
