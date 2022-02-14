# mdadm (Multiple Disk Administration)

## Cheat Sheet

Show status:

```shell
mdadm -D /dev/md126 --detail
```

```shell
cat /proc/mdstat
```

Readd disk:

```shell
mdadm /dev/md126 --fail /dev/sde3
mdadm /dev/md126 --remove /dev/sde3
mdadm /dev/md126 --add /dev/sde3
```
