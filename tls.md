# TLS

## Show Supported Versions

> Testing TLS/SSL encryption anywhere on any port

https://github.com/drwetter/testssl.sh

```shell
$ docker run --rm -ti drwetter/testssl.sh --starttls imap mail.example.com:143
[..]
 Testing protocols via sockets 
 SSLv2      not offered (OK)
 SSLv3      not offered (OK)
 TLS 1      not offered
 TLS 1.1    not offered
 TLS 1.2    offered (OK)
 TLS 1.3    offered (OK): final
```
