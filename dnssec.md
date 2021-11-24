# DNSSEC

## DNS Record Types

* `RRSIG`: Contains a cryptographic signature
* `DNSKEY`: Contains a public signing key
```
$ dig +short markusritzmann.ch dnskey          
257   3   13   2/ELdOo4TnB8Wcgm6kvJnRkLG8Z8fAA1uJrxdhxc6caCC+xfm/1WaPk9 b3II1y040n+c1qNzBY1vlCAQB0PphQ==
 ▲     ▲    ▲                              ▲
 │     │    │                              │
 │     │  Algorithm                    Public Key
 │  Protocol
Flags
```
* `DS`: Contains the hash of a DNSKEY record
```
$ dig +short @a.nic.ch markusritzmann.ch ds
5780   13   2 FBFD10E8E9B834218AD5B96B794C390E8E479E689BECC55C5004BE7E 95621960
 ▲     ▲    ▲                              ▲
 │     │    │                              │
 │     │  Digest Type (Hash Type)        Digest (Hash)
 │  Algorithm
Key Tag
```
* `NSEC` / `NSEC3`: For explicit denial-of-existence of a DNS record
* `CDNSKEY` / `CDS`: For a child zone requesting updates to DS record(s) in the parent zone

## RRsets

* All records with the same label (owner name), network class (`IN`), and type are bundled into a single RRset
* Each RRset will be signed, DNSSEC does not sign individual records

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

* The nameserver operator needs to generate a zone signing key pair (ZSK)
* A ZSK consists of a private and public key
* The public ZSK is published as `DNSKEY`-record
* Every RRset get a signature created with the private ZSK
* This signatur will be published as a `RRSIG`-record

```
RRset (Requested DNS Record set) + RRSIG (Signature) + DNSKEY (Public ZSK) = Verified RRset
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

## EPP

EPP knows two interfaces. `dsData` or `keyData`.

* `dsData`: The DS record
* `dsKey`: The DNSKEY record (the registrar then converts that to the DS record)
