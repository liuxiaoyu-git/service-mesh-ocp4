#!/bin/bash


oc new-project demo-datagrid

sleep 1

oc new-app --file datagrid/datagrid-7.3-template.yaml \
  -p APPLICATION_USER=test \
  -p APPLICATION_PASSWORD=test.1

sleep 1


if [ ! -d "istio-workshop" ] 
then
    echo "Directory istio-workshop DOES NOT exist, cloning repo" 
    git clone https://github.com/paolocarta/istio-workshop.git
fi

cd istio-workshop
git checkout ocp4-infinispan

oc project istio-demo-app

sleep 2

oc apply -f kubernetes-v1/permissive/

cd ..
# oc apply -f kubernetes-v2/permissive/


