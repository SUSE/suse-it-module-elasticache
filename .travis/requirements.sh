apt-get install -y make jq
systemctl start docker

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
