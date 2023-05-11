#!/bin/bash
clear
git_clean=False

git_push(){
if [[ $git_clean == True ]];then rm -rf .git; git init;fi
git init
git config --global user.name "hoanghd"
git config --global user.email "hoanghd164@gmail.com"
git add .
git commit -m "The first commit"

if [[ $(git remote | grep -Eoc 'kustomize-gitlab') == 0 ]];then git remote add kustomize-gitlab git@gitlab.com:hoanghd164/kustomize.git;fi
git push -u --force kustomize-gitlab master

if [[ $(git remote | grep -Eoc 'kustomize-github') == 0 ]];then git remote add kustomize-github https://github.com/hoanghd164/kustomize.git;fi
git push -u --force kustomize-github master
}
git_push