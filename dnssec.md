# DNSSEC

## DNS Record Types

* `RRSIG`: Contains a cryptographic signature
* `DNSKEY`: Contains a public signing key
* `DS`: Contains the hash of a DNSKEY record
* `NSEC` / `NSEC3`: For explicit denial-of-existence of a DNS record
* `CDNSKEY` / `CDS`: For a child zone requesting updates to DS record(s) in the parent zone

## RRsets

* All records with the same label and type are bundled into a single RRset
* Each RRset will be signed, dnssec does not sign individual records

```
↓ Label       ↓ Type
                                  ┌╴
www     IN    A       127.0.0.1   │  RRset
                                  ├╴
blog    IN    A       127.0.0.1   │  RRset
                                  ├╴
api     IN    A       127.0.0.1   │  RRset
api     IN    A       127.0.0.2   │
                                  ├╴
api     IN    TXT     test1       │  RRset
api     IN    TXT     test2       │
                                  └╴
```

## Zone Signing Key (ZSK)

* The nameserver operator need to generate a zone signing key pair (ZSK)
* A ZSK consists of a private and public key
* The public ZSK is published as `DNSKEY`-record
* Every RRset get a signature created with the private ZSK
* This signatur will be published as a `RRSIG`-record

```
RRset (Requested DNS Record) + RRSIG (Signature) + DNSKEY (Public ZSK) = Verified RRset
```

## Chain of trust

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
