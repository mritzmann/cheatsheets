# AppArmor

Linux kernel security module that allows to restrict programs.

## Logs

```shell
tail -f /var/log/kern.log | grep audit
```

## Commands

Display currently loaded AppArmor policies:

```shell
aa-status
```
