#!/bin/bash
mkdir -p ~/glpi
FILE=~/glpi/glpi-agent_1.4-1_all.deb
if test -f "$FILE"; then
    echo -e "\n$FILE exists.\n"
else
    cd ~/glpi && wget https://github.com/glpi-project/glpi-agent/releases/download/1.4/glpi-agent_1.4-1_all.deb
fi
chmod 777 ~/glpi/glpi-agent_1.4-1_all.deb
sudo apt install -y ~/glpi/glpi-agent_1.4-1_all.deb
sudo glpi-agent --server https://inventory.globalsys.com.br/glpi/ --daemon