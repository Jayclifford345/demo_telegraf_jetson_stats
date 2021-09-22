#!/usr/bin/env bash

# Note you need root privlidges to your device to install this script. 
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Install Jetson Stats
echo "Installing Jetson-Stats and Influx Telegraf"
 sudo apt-get -y update
 sudo apt-get -y install python3-pip
 sudo -H python3 -m pip install -U jetson-stats

# Install Telegraf
sudo apt-get -y install wget
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update && sudo apt-get install telegraf


# Add telegraf user to Jetson Stat group
sudo usermod -aG jetson_stats telegraf

# Copy python script to /usr/local/bin
sudo cp ./jetson_stats.py /usr/local/bin

# Copy Telegraf config over to /etc/telegraf
sudo cp ./telegraf_jetson_stats.conf /etc/telegraf/

sudo systemctl enable telegraf
sudo systemctl start telegraf

echo "Install complete. Telegraf instance is now running and collecting Jetson Stats"