# Kubernetes

```
+-------------------------+
|   Deployment            |
|                         |
|   +-----------------+   |
|   |  Pod            |   |
|   |                 |   |
|   |  +-----------+  |   |
|   |  | Container |  |   |
|   |  +-----------+  |   |          +----------------+          +----------------+
|   |                 |   |          |                |          |                |
|   |  +-----------+  |   |          |  Service       |          |  Ingress       |
|   |  | Container |  |   |          |                |          |                |
|   |  +-----------+  |   |<---------+  +----------+  |<---------+                |
|   |                 |   |          |  | 80 (TCP) |  |          |                |
|   +-----------------+   |          |  +----------+  |          |                |
|                         |          |                |          |                |
+-------------------------+          +----------------+          +----------------+
```


## Namespace

* Permission separation
* Groups all objects which belong to one project together

```shell
# create
kubectl create namespace myapp

# list
kubectl get namespace

# delete
kubectl delete namespace myapp

# set default namespace
kubectl config set-context --current --namespace=apps
```

## Exec

```shell
# jump into existing container
kubectl exec --stdin --tty nginx-796495895c-qkj89 -- /bin/bash
```

## Run

```shell
# run a new container for debugging purpose
kubectl run toolbox --namespace apps --rm -i --tty --image debian -- bash
```

## Pod

* Metalayer around one or more containers

```shell
# create
kubectl run awesome-app --image=nginx:latest --namespace myapp

# list
kubectl get pods --namespace myapp

# delete
kubectl delete pod awesome-app --namespace myapp
```

## Deployment

* Should be used instead of pods
* Covers update process, health and more

```shell
# create
kubectl apply -f deployment.yaml --namespace myapp

# list
kubectl get deployments --namespace myapp

# delete
kubectl delete deployment example-web --namespace myapp
```

`deployment.yaml`: 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: example-web
  name: example-web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: example-web
  template:
    metadata:
      labels:
        app: example-web
    spec:
      containers:
      - image: nginx:latest
        name: example-web
        resources:
          requests:
            cpu: 10m
            memory: 16Mi
          limits:
            cpu: 20m
            memory: 32Mi
```

## Service

* An ressource to expose an application running on a set of Pods as a network service

## Node

```shell
# list
kubectl get node -o wide
```

## Secrets

Get secrets

```shell
kubectl get secret regcred --output=yaml
```

## Tools

* [k9s](https://github.com/derailed/k9s) - provides a terminal UI to interact with Kubernetes
```shell
brew install k9s
k9s --namespace myapp
```
* [k3d](https://github.com/rancher/k3d) - lightweight wrapper to run [k3s](https://github.com/k3s-io/k3s/blob/master/README.md) in docker
```shell
brew install k3d
k3d cluster create mycluster --api-port 6550 -p "80:80@loadbalancer"
```
