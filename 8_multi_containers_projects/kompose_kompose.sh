#/bin/bash

pushd ./kompose

minikube start

minikube tunnel 2>/dev/null &
sleep 1m

kubectl uncordon minikube

kompose convert -o ./k8s/
kubectl apply -f ./k8s
kubectl scale --replicas=5 deployment/web
sleep 1m

minikube service --all

popd
