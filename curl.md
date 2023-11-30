# cURL

## Debuging

```shell
curl -svo /dev/null http://www.example.com/
```

## Ignore Proxy

```shell
curl --noproxy '*' https://example.com
```

## Fake DNS

Provide a custom address for a specific host and port pair:

```shell
curl --resolve example.com:443:127.0.0.1 https://example.com
curl --connect-to 127.0.0.1 https://example.com
```

## Test TLS

```shell
curl --tlsv1.0 https://google.com
curl --tlsv1.1 https://google.com
curl --tlsv1.2 https://google.com
curl --tlsv1.3 https://google.com
```

## Headers

Provide host header:

```shell
curl --header "Host: example.com" http://localhost/
curl -H "Host: _" http://localhost/
```

## User-Agent

```shell
curl --user-agent "Monit/5.27.1" http://127.0.0.1:8022/
curl -H "Monit/5.27.1" http://127.0.0.1:8022/
```

## Basic Auth

```shell
curl -u admin:admin https://example.com/
```
