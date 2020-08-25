kubectl create namespace ingress

helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm install nginx-ingress stable/nginx-ingress --namespace ingress --set controller.replicaCount=2 --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux

kubectl get service nginx-ingress-controller --namespace ingress -w

# update public ip from previous command in the ratings-web-ingresswithSSL.yaml
kubectl apply --namespace ratingsapp -f ratings-web-ingresswithSSL.yaml
