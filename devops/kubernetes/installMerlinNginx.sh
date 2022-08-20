##This script is designed to be run from within the devops/kubernetes directory of this project.

##These install scripts require a running Kubernetes cluster, kubectl and helm installed.
##This script also requires all the required docker images be loaded into the docker repository

#Create Namespace
kubectl create namespace merlin-phase1

#Install NGINX
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace merlin-phase1 --create-namespace

#Install and Start Kafka
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install -n merlin-phase1 --set deleteTopicEnable=true kafka bitnami/kafka

###Start SOS Endpoint
kubectl apply -f sos-endpoint/sos-endpoint.yaml
kubectl apply -f sos-endpoint/ingress/sos-endpoint-nginx.yaml

###Start SOS Transformer
kubectl apply -f sos-transformer/sos-transformation-service.yaml

###Start Merlin UI
kubectl apply -f ui/merlin-ui.yaml
kubectl apply -f ui/ingress/merlin-ui-nginx.yaml