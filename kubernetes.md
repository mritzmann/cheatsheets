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
