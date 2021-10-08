# DNSSEC

## Chain of trust.

```
| . (root)   |       | org.             |       | example.org.         |       | sub.example.org. |
| ---------- |       | ---------------- |       | -------------------- |       | ---------------- |
| SOA        |       | SOA              |       | SOA                  |       | SOA              |
| NS         |       | NS               |       | NS                   |       | NS               |
| DNSKEY     |   ┌── | DNSKEY           |   ┌── | DNSKEY               |   ┌── | DNSKEY           |
| DS (org)   | ──┘   | DS (example.org) | ──┘   | DS (sub.example.org) | ──┘   | AAAA             |
```

(Diagram: Original by [@jpmens](https://jpmens.net/2021/06/09/visualizing-the-dnssec-chain-of-trust/))
