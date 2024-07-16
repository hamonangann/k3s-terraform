sudo apt update
sudo apt install -y nfs-kernel-server

sudo mkdir /nfsdata -p

sudo echo "/nfsdata *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
sudo systemctl restart nfs-kernel-server