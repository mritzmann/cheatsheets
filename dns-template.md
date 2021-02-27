# DNS Template

DNS Template for empty Domains.

```shell
# prevents sender spoofing for domains which do not send emails anyway
example.com         IN  TXT  v=spf1 mx -all
_dmarc.example.com  IN  TXT  p=reject

# indicates that this domain cannot receive emails
# https://tools.ietf.org/html/rfc7505
example.com         IN  MX   0 .
```
