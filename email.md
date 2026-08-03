# E-Mail

## SPF (Sender Policy Framework)

* SPF validate against the `envelope-from:` header
* DMARC, on the other hand, validates against `from:`

Validate SPF:

```shell
# Example Header to validate:
# > Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])

docker run --rm -it debian:latest
apt install --yes --update spfquery
spfquery \
  --ip 2a00:1450:4864:20::12a \
  --sender sender@example.com \
  --helo mail-lf1-x12a.google.com
```

## DMARC (Domain-based Message Authentication, Reporting and Conformance)

```
dig +short _dmarc.example.com txt
```
