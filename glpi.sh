#!/bin/bash
FILE=~/glpi/glpi-agent_1.4-1_all.deb
if test -f "$FILE"; then
    echo -e "\n$FILE exists.\n"
else
    cd /root/glpi && wget https://github.com/glpi-project/glpi-agent/releases/download/1.4/glpi-agent_1.4-1_all.deb
fi
chmod 777 /root/glpi/glpi-agent_1.4-1_all.deb
apt update -y
clear
apt install -y /root/glpi/glpi-agent_1.4-1_all.deb
glpi-agent --server https://inventory.globalsys.com.br/glpi --daemon

command="glpi-agent --server https://inventory.globalsys.com.br/glpi --daemon"
job="0 15 * * * $command"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab - -u root