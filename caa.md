# DNS CAA Record

## RFC

* [RFC 8659](https://www.rfc-editor.org/rfc/rfc8659): CAA Resource Record
* [RFC 8657](https://www.rfc-editor.org/rfc/rfc8657): CAA Record Extensions for Account URI and ACME Method Binding

## Syntax

Allow Let’s Encrypt:

```shell
example.com. IN CAA 0 issue "letsencrypt.org"
```

Only allow specific validation methods:

```shell
example.com. IN CAA 0 issue "letsencrypt.org; validationmethods=dns-01"
example.com. IN CAA 0 issue "letsencrypt.org; validationmethods=http-01"
example.com. IN CAA 0 issue "letsencrypt.org; validationmethods=tls-alpn-01"
```

Only allow specific account:

```
example.com. IN CAA 0 issue "letsencrypt.org; accounturi=https://acme-v02.api.letsencrypt.org/acme/acct/159998200"
```
