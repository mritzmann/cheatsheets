# Nftables

## Scripting

* You can manage nftables rules in a single file
* As soon as you execute the file, the rules will be applied

```bash
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
  chain input {
    # allow incomint ssh
    tcp dport 22 accept

  }
  chain forward {

  }
  chain output {
    # allow outgoing ssh, http, https
    tcp dport { 22, 80, 443 } accept

    # allow outgoing dns to google
    tcp dport 53 ip daddr 8.8.8.8 accept
    udp dport 53 ip daddr 8.8.8.8 accept
    tcp dport 53 ip6 daddr 2001:4860:4860::8888 accept
    udp dport 53 ip6 daddr 2001:4860:4860::8888 accept
  }
}
```

## Commands

```shell
# list tables
nft list tables

# list chains
nft list chains

# monitor rule changes
nft monitor
```

## Defaults

Debian:

| Version              | Default Firewall Backend |
| :------------------- | :----------------------- |
| Debian  9 (Stretch)  | iptables
| Debian 10 (Buster)   | nftables
| Debian 11 (Bullseye) | nftables
