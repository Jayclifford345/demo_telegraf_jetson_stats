# Jetson_Stats and Telegraf

This tutorial will show you how you can monitor your Jetson device using [Jetson_Stats](https://github.com/rbonghi/jetson_stats) and [Telegraf](https://github.com/influxdata/telegraf). 

The goal:

Jetson_Stats -> python_script -> Telegraf -> Influx OSS and Influx Cloud 

## Things you will need

- Jetson Device 
- Influx Cloud Account (Free Tier)

Install Telegraf on your Jetson device:
```bash
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt-get update && sudo apt-get install telegraf
```
Install Jetson_Stats on your Jetson Device. Make sure to also add the telegraf user to the jetson_stats group:
``` bash
sudo -H pip3 install -U jetson-stats
sudo usermod -aG jetson_stats telegraf
```
## Guide

Please follow my blog [here]()

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.