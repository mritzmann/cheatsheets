# DNSSEC

## DNS Record Types

* `RRSIG`: Contains a cryptographic signature
* `DNSKEY`: Contains a public signing key
* `DS`: Contains the hash of a DNSKEY record
* `NSEC` / `NSEC3`: For explicit denial-of-existence of a DNS record
* `CDNSKEY` / `CDS`: For a child zone requesting updates to DS record(s) in the parent zone

## Chain of trust.

* Every child zone and their parent zone have a `DS` / `DNSKEY` pair

```
| . (root)   |       | org.             |       | example.org.         |       | sub.example.org. |
| ---------- |       | ---------------- |       | -------------------- |       | ---------------- |
| SOA        |       | SOA              |       | SOA                  |       | SOA              |
| NS         |       | NS               |       | NS                   |       | NS               |
| DNSKEY     |   ┌── | DNSKEY           |   ┌── | DNSKEY               |   ┌── | DNSKEY           |
| DS (org)   | ──┘   | DS (example.org) | ──┘   | DS (sub.example.org) | ──┘   | AAAA             |
```

(Diagram: Original by [@jpmens](https://jpmens.net/2021/06/09/visualizing-the-dnssec-chain-of-trust/))
