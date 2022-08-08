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
