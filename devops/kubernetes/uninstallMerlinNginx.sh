
#Uninstall Nginx
helm uninstall -n merlin-phase1 ingress-nginx

#Uninstall Kafka
helm uninstall -n merlin-phase1 kafka

#Uninstall SOS Endpoint
kubectl delete -f sos-endpoint/sos-endpoint.yaml
kubectl delete -f sos-endpoint/ingress/sos-endpoint-nginx.yaml

#Uninstall SOS Transformer
kubectl delete -f sos-transformer/sos-transformation-service.yaml

#Uninstall Merlin UI
kubectl delete -f ui/merlin-ui.yaml
kubectl delete -f ui/ingress/merlin-ui-nginx.yaml