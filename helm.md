# Helm

The package manager for Kubernetes.

## Upgrade

Upgrades a release to a new version of a chart.

```shell
helm upgrade app ./helm/ --namespace my-namespace --install --create-namespace
```

## Template

Render templates and display the output.

```shell
helm template app ./helm/ --namespace my-namespace
```
