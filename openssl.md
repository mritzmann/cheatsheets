# OpenSSL

## Convert

From pfx to plain:

```shell
openssl pkcs12 -in <file>.pfx -nocerts -out <file>.key
```

From pem to plain:

```shell
openssl x509 -in <file>.crt.pem -out <file>.crt
```

From DER to plain:

```shell
openssl x509 -inform der -in <file>.crt -out <file>.crt
```

## Remove Password

```shell
openssl rsa -in <key-with-password>.key -out <key-without-password>.key
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

See: [RFC3280 4.2.2.1](https://datatracker.ietf.org/doc/html/rfc3280#section-4.2.2.1) 

```shell
$ openssl x509 -in example.com.crt.pem -text -noout | grep -i "Authority Information Access" -A2
            Authority Information Access: 
                CA Issuers - URI:http://trust.quovadisglobal.com/quovadiseuropeevsslcag1.crt
                OCSP - URI:http://ocsp.quovadisglobal.com
```

## Test IMAP

```shell
openssl s_client -connect imap-mail.outlook.com:993 -crlf -quiet
```
