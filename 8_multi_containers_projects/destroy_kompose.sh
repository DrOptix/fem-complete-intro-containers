#/bin/bash

pushd ./kompose

kill $(pgrep --full "minikube tunnel")
kubectl delete all --all
minikube stop

echo
echo "Minikube and Kubernetes stopped"

popd
