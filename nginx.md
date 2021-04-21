# Nginx

Some Examples.

## DCV (Domain Control Validation)

```nginx
location ~ ^\/.well-known\/pki-validation\/fileauth\.txt$ {
        allow all;
        satisfy any;
        alias /pfad/zu/fileauth.txt;
}
```

## Access-Control-Allow-Origin: Multiple Domains

```nginx
location ~* \.(eot|ttf|woff|woff2)$ {
    root    /home/$username/www/;

        if ($http_origin ~* "^https?://example01\.com$" ) {
            add_header "Access-Control-Allow-Origin" "$http_origin";
        }

        if ($http_origin ~* "^https?://example02\.com$" ) {
            add_header "Access-Control-Allow-Origin" "$http_origin";
        }
}
```

```shell
$ curl -H "Origin: https://example02.com" --verbose https://example.com/test/test.woff 2>&1 | grep -i Access
Access-Control-Allow-Origin: https://example02.com

$ curl -H "Origin: https://example01.com" --verbose https://example.com/test/test.woff 2>&1 | grep -i Access
Access-Control-Allow-Origin: https://example01.com

$ curl -H "Origin: https://bad.example.com" --verbose https://example.com/test/test.woff 2>&1 | grep -i Access
```
