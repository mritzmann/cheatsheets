# Reboot Linux

## The Safe Way

```shell
shutdown -r now
shutdown -r now --force

# after 10 minutes
shutdown -r 10
```

## The Hard Way

```shell
echo b > /proc/sysrq-trigger
```
