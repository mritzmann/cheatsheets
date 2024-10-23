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
