# DNS Template

DNS Template for empty Domains.

```shell
# Prevents sender spoofing for domains which do not send emails anyway.
example.com         IN  TXT  v=spf1 mx -all
_dmarc.example.com  IN  TXT  p=reject

# Indicates that this domain cannot receive emails.
# https://tools.ietf.org/html/rfc7505
#
# Otherwise, some senders do a fallback to the A or AAA-Record
# and try several times until delivery fails
example.com         IN  MX   0 .
```
