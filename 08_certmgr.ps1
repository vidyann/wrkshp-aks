kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.14/deploy/manifests/00-crds.yaml

helm install cert-manager --namespace cert-manager --version v0.14.0 jetstack/cert-manager

kubectl get pods --namespace cert-manager

kubectl apply --namespace ratingsapp -f cluster-issuer.yaml

kubectl describe cert ratings-web-cert --namespace ratingsapp




