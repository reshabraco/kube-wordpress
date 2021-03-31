# yum clean all
# yum repolist
# yum update
# setenforce 0
# getenforce
# sestatus
# vi /etc/selinux/config
  SELINUX=permissive
# wget https://download.docker.com/linux/centos/docker-ce.repo
# cp docker-ce.repo /etc/yum.repos.d/
# yum install docker-ce
# systemctl enable docker.service
# systemctl start docker.service
# curl https://storage.googleapis.com/kubernetes-release/release/stable.txt
# wget https://storage.googleapis.com/kubernetes-release/release/v1.18.1/bin/linux/amd64/kubectl
# chmod +x kubectl
# cp kubectl /usr/local/bin
# wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# mv minikube-linux-amd64 minikube
# chmod +x minikube
# cp minikube /usr/local/bin
# useradd -G docker kube
# su - kube
$ minikube config set driver docker
$ minikube start --driver=docker
$ docker image ls
$ docker container ls
$ minikube status
$ kubectl get po -A
$ pwd
  /home/kube
$ mkdir wordpressdb-data
$ sudo chown polkitd:root wordpressdb-data
$ mkdir wordpress-data
$ sudo chown 33:tape wordpress-data
$ mkdir wordpress-config
$ cd wordpress-config
$ ls -l /home/kube/wordpress-config
kustomization.yaml
wordpressdb-deployment.yaml
wordpressdb-pv-pvc.yaml
wordpressdb-svc.yaml
wordpress-deployment.yaml
wordpress-pv-pvc.yaml
wordpress-svc.yaml
$ pwd
 /home/kube/wordpress-config
$ kubectl apply -k ./
