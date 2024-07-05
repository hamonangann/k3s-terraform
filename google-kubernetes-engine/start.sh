# PRASYARAT: gcloud SDK, terraform, kubectl
# Disarankan menggunakan Cloud Shell agar tidak perlu instal manual

# Set zona
#! /bin/bash
gcloud config set compute/zone us-west1-a

# Buat mesin klaster GKE (instalasi otomatis) dan mesin klien
terraform init
terraform apply -var "project=$(gcloud config get-value project)"

# Dapatkan kredensial klaster untuk kubectl
gcloud container clusters get-credentials cluster

# Salin kredensial klaster ke client
gcloud compute scp ~/.kube/config $(whoami)@client:/tmp
gcloud compute ssh client --command='sudo sh -c "echo export KUBECONFIG=/tmp/config >> /etc/profile"'