#!/bin/sh
yum clean all
yum repolist
yum update
setenforce 0
getenforce
sestatus
wget https://download.docker.com/linux/centos/docker-ce.repo
cp docker-ce.repo /etc/yum.repos.d/
yum install docker-ce
systemctl enable docker.service
systemctl start docker.service
curl https://storage.googleapis.com/kubernetes-release/release/stable.txt
wget https://storage.googleapis.com/kubernetes-release/release/v1.18.1/bin/linux/amd64/kubectl
chmod +x kubectl
cp kubectl /usr/local/bin
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
mv minikube-linux-amd64 minikube
chmod +x minikube
cp minikube /usr/local/bin
useradd -G docker kube
mkdir /home/kube/wordpressdb-data
chown polkitd:root /home/kube/wordpressdb-data
mkdir /home/kube/wordpress-data
chown 33:tape /home/kube/wordpress-data
mkdir -p /home/kube/wordpress-config
chown kube:kube /home/kube/wordpress-config
cp *.yml /home/kube/wordpress-config
cd /home/kube/wordpress-config && chown kube:kube *
su - kube -c "minikube config set driver docker"
su - kube -c "minikube start --driver=docker"
su - kube -c "docker image ls"
su - kube -c "docker container ls"
su - kube -c "minikube status"
su - kube -c "kubectl get po -A"
su - kube -c "/home/kube/wordpress-config/kubectl apply -k ./"
