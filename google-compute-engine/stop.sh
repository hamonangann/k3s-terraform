#! /bin/bash
terraform destroy -var "project=$(gcloud config get-value project)"