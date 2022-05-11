# DNSSEC

## DNS Record Types

* `RRSIG`: Contains a cryptographic signature
* `DNSKEY`: Contains a public signing key
```
$ dig +short markusritzmann.ch dnskey          
257    3   13   2/ELdOo4TnB8Wcgm6kvJnRkLG8Z8fAA1uJrxdhxc6caCC+xfm/1WaPk9 b3II1y040n+c1qNzBY1vlCAQB0PphQ==
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

* All records with the same label (name) and type are bundled into a single RRset
* Each RRset will be signed, DNSSEC does not sign individual records
* RRset + RRSIG (Signature) + DNSKEY (Public Key) = Verified RRset

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

## Signing Keys

* A DNS zone can be signed with one more more key pairs
* There are the following two methods for signing your DNS zone 

### KSK and ZSK (The "old" way) 

The nameserver operator generate a key signing key (KSK) and a zone signing key (ZSK).

* KSK ensures the chain of trust to the parent zone
  * Hash is published as a DS record in the parent zone
  * Signs only the DNSKEY RRset
* ZSK is then used to sign the rest of your DNS zone
  * Signs each RRset
* Since two private keys are used, the ZSK can be rotated independently of the KSK
* PowerDNS: default before 4.0 (18.12.2020)

### CSK (The "new" way)

The nameserver operator generate a combined signing key (CSK).

* CSK acts as a KSK and ZSK, a single private key is used for both 
* PowerDNS: default since 4.0 (18.12.2020)

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

## Extensible Provisioning Protocol (EPP)

Protocol between registrar and registry to manage domain names. EPP knows two interfaces for DNSSEC:

* `dsData`: The DS record
* `dsKey`: The DNSKEY record (the registrar then converts that to the DS record)

## Tools

* DNSSEC Analyzer: https://dnssec-analyzer.verisignlabs.com/
* Visualizing the DNSSEC status of a DNS zone: https://dnsviz.net/
```shell
# analyze dns zone
dnsviz probe switch.ch | dnsviz print

# generate graph
dnsviz probe -A -a . switch.ch | dnsviz graph -T png -O
```
* Google DNS (shows dnssec errors as comments)
```shell
curl -s https://dns.google/resolve\?name\=example.com\&type\=A | jq .Comment
```

## Reference

* [BIND DNSSEC guide](https://bind9.readthedocs.io/en/latest/dnssec-guide.html)
* [Cloudflare: How DNSSEC works](https://www.cloudflare.com/dns/dnssec/how-dnssec-works/)
