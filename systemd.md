# Systemd

## Edit

Path for configuration files: `/etc/systemd/system`

Reload configuration:

```
systemctl daemon-reload
```

## Debugging

Reihenfolge Startup:

```shell
systemd-analyze plot > startup_order.svg
```

Langsame Services:

```shell
systemd-analyze blame
```

## systemctl

List:

```shell
systemctl list-units
systemctl list-units --user
systemctl list-units --user --type=service
```

Enable/disable:

```shell
systemctl --user enable docker
systemctl --user disable docker
```

Syntax Check:

```shell
systemd-analyze --user verify /etc/systemd/user/docker.service
```

Restart:

```shell
systemctl --user daemon-reexec
```

Reload:

```shell
systemctl --user daemon-reload
```
