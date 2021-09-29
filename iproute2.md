# iproute2

Known for the `ip` command.

## Subcommands

| Subcomand | Description |
| --------- | ----------- |
| `addr`    | Manage IP |
| `link`    | Manage state of network interfaces |
| `route`   | Manage routing table |
| `maddr`   | Manage multicast IP |
| `neigh`   | Show ARP table |

## addr

```shell
# add an address to device eth0
ip addr add 192.168.1.15/24 dev eth0

# delete an address
ip addr del 192.168.1.15/25 dev eth0
```

## link

```shell
# up and down
ip link set eth0 up
ip link set eth0 down
```

## route

```shell
# add and delete route for default via 192.168.1.1 through eth0
ip route add default via 192.168.1.1 dev eth0
ip route delete default via 192.168.1.1 dev eth0

# add route for 192.168.1.0/24 via 192.168.1.1
ip route add 192.168.1.0/24 via 192.168.1.1
ip route delete 192.168.1.0/24 via 192.168.1.1

# show route info for this ip
ip route get 192.168.1.16
```
