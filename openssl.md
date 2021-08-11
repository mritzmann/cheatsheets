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

From DER to plain text:

```shell
openssl x509 -inform der -in <file>.crt -out <file>.crt
```

Find intermediate cert from site cert:

```shell
openssl x509 -in <file>.crt.pem -text -noout | grep -i 'CA Issuers'
```

## Read Cert

```shell
# read cert in PEM format
openssl x509 -in cert.crt -text

# read cert in DER format
openssl x509 -in cert.crt -inform DER -text

# read cert in pkcs12 format
openssl pkcs12 -in cert.crt -info
```

## Self Signed Certificate

```shell
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout example.key -out example.crt -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:example.com,DNS:www.example.com,IP:127.0.0.1"
```

## Show Public Key

```shell
openssl s_client -connect example.com:443 -servername example.com < /dev/null 2>/dev/null | openssl x509 -text -in /dev/stdin
```

```shell
# inkl. intermediate
openssl s_client -showcerts -connect example.com:443 -servername example.com
```

## Find Intermediate Certificate

```shell
$ openssl x509 -in example.com.crt.pem -text -noout | grep -i "CA Issuers"
                CA Issuers - URI:http://trust.quovadisglobal.com/qvsslg2.crt
```
