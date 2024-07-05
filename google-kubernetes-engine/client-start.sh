#! /bin/bash
sudo apt update
sudo apt install -y git
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y kubectl
sudo apt install -y google-cloud-sdk-gke-gcloud-auth-plugin
cd /srv
python3 -m venv /srv/venv
source /srv/venv/bin/activate
pip3 install aiohttp
pip3 install pandas
pip3 install matplotlib
git clone https://github.com/hamonangann/thesis
sudo chmod 777 ./thesis/test/
EOF