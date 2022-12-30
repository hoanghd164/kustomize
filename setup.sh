#!/bin/bash
clear
# rm -rf .git
# git init
git config --global user.name "hoanghd"
git config --global user.email "hoanghd164@gmail.com"
git add .
git commit -m "The first commit"

if [[ $(git remote | grep -Eoc 'kustomize-gitlab') == 0 ]];then git remote add kustomize-gitlab git@gitlab.com:hoanghd164/kustomize.git;fi
git push -u --force kustomize-gitlab master

if [[ $(git remote | grep -Eoc 'kustomize-github') == 0 ]];then git remote add kustomize-github https://github.com/hoanghd164/kustomize.git;fi
git push -u --force kustomize-github master


# KUSTOM_HOME=$(mktemp -d)
# BASE=$KUSTOM_HOME/base
# mkdir $BASE
# WORDPRESS_HOME=$BASE/wordpress
# mkdir $WORDPRESS_HOME
# cd $WORDPRESS_HOME

# snap install kustomize
# opsys=linux
# curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest |\
#   grep browser_download |\
#   grep $opsys |\
#   cut -d '"' -f 4 |\
#   xargs curl -O -L
# mv kustomize_*_${opsys}_amd64 kustomize
# chmod u+x kustomize

# $ kustomize version
# {Version:kustomize/v4.5.7 GitCommit:56d82a8378dfc8dc3b3b1085e5a6e67b82966bd7 BuildDate:2022-08-02T16:35:54Z GoOs:linux GoArch:amd64}

# kubectl apply -f $WORDPRESS_HOME
# kubectl delete -f $WORDPRESS_HOME

# cat > deployment.yaml << 'OEF'
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: wordpress
#   labels:
#     app: wordpress
# spec:
#   selector:
#     matchLabels:
#       app: wordpress
#   strategy:
#     type: Recreate
#   template:
#     metadata:
#       labels:
#         app: wordpress
#     spec:
#       containers:
#       - image: wordpress:4.8-apache
#         name: wordpress
#         ports:
#         - containerPort: 80
#           name: wordpress
#         volumeMounts:
#         - name: wordpress-persistent-storage
#           mountPath: /var/www/html
#       volumes:
#       - name: wordpress-persistent-storage
#         emptyDir: {}
# OEF

# cat > service.yaml << 'OEF'
# apiVersion: v1
# kind: Service
# metadata:
#   name: wordpress
#   labels:
#     app: wordpress
# spec:
#   ports:
#     - port: 80
#   selector:
#     app: wordpress
#   type: LoadBalancer
# OEF

# cat > kustomization.yaml << 'OEF'
# resources:
# - deployment.yaml
# - service.yaml

# commonLabels:
#   app: my-wordpress
# OEF

# kustomize build /home/kustomize