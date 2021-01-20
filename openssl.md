# OpenSSL

## Convert

From pfx to plain text:

```shell
openssl pkcs12 -in <file>.pfx -nocerts -out <file>.key
```

From pem to plain text:

```shell
openssl x509 -in <file>.crt.pem -out <file>.crt   
```

Find intermediate cert from site cert:

```shell
openssl x509 -in <file>.crt.pem -text -noout | grep -i 'CA Issuers'
```
