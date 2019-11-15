#!/bin/bash
echo ##############################################
echo # Deploy cassandra to k8s
echo ##############################################

set p = $(echo $PWD | awk -v h="scripts" '$0 ~h')
if [[ $PWD = */scripts ]]; then
 cd ..
fi

nspace="greencompute"
echo "Verify cassandra not deployed under namespace: " $nspace
svc=$(kubectl get svc  --namespace $nspace | grep cassandra-svc)
if [ -z "$svc" ]; then
  echo "Cassandra service not found under namespace " $nspace "...install it"
    kubectl apply -f ./deployments/cassandra/prod/cassandra-service.yml --namespace $nspace
    kubectl apply -f ./deployments/cassandra/prod/cassandra-ingress.yml --namespace $nspace
fi
echo "Found cassandra service: " $svc " under namespace " $nspace


pvs=$(kubectl get pv  --namespace $nspace | grep cassandra-data )
if [ -z "$pvs" ]; then
  echo "Cassandra Persistence volumes not found... install them"
  kubectl apply -f ./deployments/cassandra/prod/cassandra-volumes.yml --namespace $nspace

  echo sleep to be sure PVs are created
  sleep 10
fi
echo "Found cassandra PVs "
echo $pvs

echo "Search for statefuleset"
sfs=$(kubectl get statefulset --namespace $nspace | grep cassandra)
if [ -z "$sfs" ]; then
  echo "Cassandra Statefulset not found... "
    kubectl apply -f ./deployments/cassandra/prod/cassandra-statefulset.yml --namespace $nspace
fi
echo "Found cassandra statefulset "
kubectl get statefulsets -n $nspace

kubectl get pods -o wide -n $nspace
