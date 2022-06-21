# E-Mail

## SPF (Sender Policy Framework)

* SPF validate against the `envelope-from:` header
* DMARC, on the other hand, validates against `from:`

## DMARC (Domain-based Message Authentication, Reporting and Conformance)

```
dig +short _dmarc.example.com txt
```
