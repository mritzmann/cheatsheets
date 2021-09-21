# cURL

Ignore Proxy:

```shell
curl --noproxy '*' https://example.com
```

Provide a custom address for a specific host and port pair:

```shell
curl --resolve example.com:443:127.0.0.1 https://example.com
```

Provide host header:

```shell
curl -H "Host: example.com" http://localhost/
```
