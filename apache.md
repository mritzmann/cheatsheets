# Apache2

Config test:

```shell
apachectl configtest
```

Show loaded modules:

```shell
apachectl -M

# same as
apachectl -t -D DUMP_MODULES
```

Proxy:

```
ProxyPass / http://127.0.0.1:8080/
ProxyPassReverse / http://127.0.0.1:8080/
```

Location:

```
<location /test>
  ProxyPass http://127.0.0.1:8080/
  ProxyPassReverse http://127.0.0.1:8080/
</location>
```
