# GitLab (Omnibus)

## Edit Configuration

```shell
vi /etc/gitlab/gitlab.rb
gitlab-ctl reconfigure
```

## GitLab Backup

Create new backup:

```shell
gitlab-backup create
```

Delete backup:

```shell
cd /var/opt/gitlab/backups
rm <backup-name>.tar
```

## Projects Failed Their Last Repository Check

E-Mail message to GitLab administrator:

> 3 projects failed their last repository check.  
> See the affected projects in the GitLab admin panel

Fix:

```shell
docker exec -it <gitlab-container> bash
cd /var/opt/gitlab/git-data/repositories/

# see gitlab admin ui for path: https://example.com/admin/projects/
cd @hashed/c8/37/<uid>.git

git gc
chown git: . -R
```

## GitLab CI

* Build and push a image with [Kaniko](https://github.com/GoogleContainerTools/kaniko)
* Kaniko is a tool to build container images from a `Dockerfile`, inside a container or Kubernetes cluster

```yml
build:
  image:
    name: gcr.io/kaniko-project/executor:debug
    entrypoint: [""]
  script:
    - /kaniko/executor
      --context "${CI_PROJECT_DIR}"
      --dockerfile "${CI_PROJECT_DIR}/Dockerfile"
      --destination "${CI_REGISTRY_IMAGE}:${CI_COMMIT_TAG}"
```
