rem Uninstall Nginx
helm uninstall -n merlin-phase1 ingress-nginx

rem Uninstall Kafka
helm uninstall -n merlin-phase1 kafka

rem Uninstall SOS Endpoint
kubectl delete -f sos-endpoint/sos-endpoint.yaml

rem Uninstall SOS Transformer
kubectl delete -f sos-transformer/sos-transformation-service.yaml

rem Uninstall Merlin UI
kubectl delete -f ui/merlin-ui.yaml

rem Uninstall Ingress Controllers
kubectl delete -f ui/ingress/merlin-ui-nginx.yaml
kubectl delete -f sos-endpoint/ingress/sos-endpoint-nginx.yaml