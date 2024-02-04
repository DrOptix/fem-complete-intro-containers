#/bin/bash

pushd ./kompose

minikube tunnel &
minikube_tunnel_pid=$!

minikube start && kubectl uncordon minikube

kompose convert -o ./k8s/

kubectl replace --force -f ./k8s

url=$(minikube service web-tcp --url)

echo
echo "Minikube Tunnel PID: $minikube_tunnel_pid"
echo "Copied to clipboard: $url"
echo -e $url | xclip -sel clip

popd
