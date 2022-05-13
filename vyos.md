# VyOS

Workfolow:

```shell
configure
<command>
commit
save
```

Some example commands.

```shell
# adds
set 'interfaces' 'ethernet' 'eth0' 'vif' '1011' 'address' '2a04:503:0:1011::3/64'

# remove
delete 'interfaces' 'ethernet' 'eth0' 'vif' '1011' 'address' '2a04:503:0:1011::3/64'

# show
show 'interfaces' 'ethernet' 'eth0' 'vif' '1011'

# applies the change
commit

# persists the change
save

# show routes to ip
show ip bgp 8.8.8.8
```
