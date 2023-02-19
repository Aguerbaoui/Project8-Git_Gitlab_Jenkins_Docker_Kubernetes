Setps to release this projet 08 
Git ---> Gitlab ---> sv1:Jenkins (avec Jenkinsfile) ---> sv2:Kubernetes (service NodePort): projet j2e
## Step 1:
Create an ec2 instance server 2
## Step 2:
Make sure to install Docker for the version 1.22 of kubernets because the latest version works with ContainerD
## Step 3:
Follow theses steps to install a K8S cluster using the tool Kubeadm

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
## Forwarding IPv4 and letting iptables see bridged traffic
https://kubernetes.io/docs/setup/production-environment/container-runtimes/#forwarding-ipv4-and-letting-iptables-see-bridged-traffic
## Every instruction should be added in both Master and Worker 
## Step 4:
If we are gonna use a docker as a container runtime we should install docker first and then install cri-dockerd which is:
"This adapter provides a shim for Docker Engine that lets you control Docker via the Kubernetes Container Runtime Interface"

install docker CE(community edition)
##  Step 5
Installing kubeadm, kubelet and kubectl
using this link : https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl
il va installer la derniére version 
donc je dois specifier 
sudo apt-get install -y kubelet=1.22.0-00 kubeadm=1.22.0-00 kubectl=1.22.0-00 : on a fait la downgrade puisque j'ai installer au début la version latest 
sudo apt-mark hold kubelet kubeadm kubectl : madaech ta3mel mis a jour les les packages 

## Step 6 
*****Installation 
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
## step 7
donner la privilege Master pour votre node 
sudo kubeadm init
## Step 8 et puis vous devez taper les commandes suivantes
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config : communication entre LAPI  server et kubectl feha el authentification w el certification.
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config


mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

## Step 9 you should install un pod network bech les pods ychoufou b3adhhom w ya7kiw m3a badhhom networking entre les applications. , addressage pour la communication entre eux(switch)
il ya plusieurs types de network, le meilleur est calico
vous pouvez installer calico en utilisant le lien suivant:
https://docs.tigera.io/

curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml -O
please use this one not the above one:
curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml -O
*** kubectl apply -f calico.yaml
**** sudo kubeadm reset : to delete the cluster 
coredns: le DNS entre les pods , DNS interne. yetla3 ki ki fama netwoking lel les pods bech ya7kiw m3a b3adhhom
ma tetla3 ken ma fama pod networking tala3 pour cette raison on doit activer le pod networking calico:
kubectl apply -f calico.yml : -f cad un fichier 
*** une fois coredns lgua calico-kube khdem  et calico-kube sont running le compte est bin 
****scheduler bech y7ot el pod 3la node mel nodes

## Remarques useful links:
https://kubernetes.io/fr/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
## Kubelet houwa eli tala3 el image w tala3 el container using this command
****kubectl run mypod --image nginx:alpine**
## in which node my pod was assigned using this command:
***** kubectl describe pod mypod***
***** kubectl get po -o wide***

***kubectl taint nodes --all dedicated:NoSchedule-****
this command is used to untain a node 
if i get some problems i should rename the master node 
## Crrer un deployement et un nodePort service pour tomcat pour acceder au tomcat depuis l'esxtérieur il faut taper la commande suivante:
http://50.18.137.175:30218
30218 c'est le port du service NodePort pour accdéder depuis l'extérieur.
curl http://<public-node-ip>:<node-port>
you can use this link :
https://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/
curl http://52.53.152.38:32221/
http://52.53.152.38:32221/webapp/