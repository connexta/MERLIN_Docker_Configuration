rem This script is designed to be run from within the devops/kubernetes directory of this project.

rem These install scripts require a running Kubernetes cluster, kubectl and helm installed.
rem This script also requires all the required docker images be loaded into the docker repository
rem Create Namespace
kubectl create namespace merlin-phase1

rem Install NGINX
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace merlin-phase1 --create-namespace

rem Install and Start Kafka
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install -n merlin-phase1 --set deleteTopicEnable=true kafka bitnami/kafka

rem Start SOS Endpoint
kubectl apply -f sos-endpoint/sos-endpoint.yaml

rem Start SOS Transformer
kubectl apply -f sos-transformer/sos-transformation-service.yaml

rem Start Merlin UI
kubectl apply -f ui/merlin-ui.yaml

rem Start Ingress Controllers
kubectl apply -f ui/ingress/merlin-ui-nginx.yaml
kubectl apply -f sos-endpoint/ingress/sos-endpoint-nginx.yaml