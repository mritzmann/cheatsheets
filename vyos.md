# VyOS

## General

Version:

```shell
show version
```

## Workflow

```shell
configure
<command>
commit
save
```

## BGP (Border Gateway Protocol)

Show all peering status:

```shell
show ip bgp summary
```

Check specific peer:

```shell
show ip bgp neighbor <ip of neighbor>
```

Show route to ip:

```shell
show ip bgp 8.8.8.8
```

## Links

* Cheat Sheet: https://github.com/bertvv/cheat-sheets/blob/master/docs/VyOS.md
