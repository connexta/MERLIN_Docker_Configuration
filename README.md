# Purpose

This Repository contains the configuration files required to run MERLIN via Docker Compose and Kubernetes.

# Deployment
## Docker Compose
###Startup 
To run the system MERLIN with Docker Compose run the following command 
```shell
$ docker-compose -f devops/compose/docker-compose.yaml up -d
```

###Shutdown
```shell
$ docker-compose -f devops/compose/docker-compose.yaml down
```


## Kubernetes
TBD

