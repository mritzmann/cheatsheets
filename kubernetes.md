# Kubernetes

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
