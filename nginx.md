# Nginx

Some NGINX Examples.

## DCV (Domain Control Validation)

```nginx
location ~ ^\/.well-known\/pki-validation\/fileauth\.txt$ {
        allow all;
        satisfy any;
        alias /pfad/zu/fileauth.txt;
}
```

## ACME Challenge

```nginx
# Generation 5
location ~ ^\/.well-known\/acme-challenge\/(.*)$ {
        allow all;
        satisfy any;
        alias /usr/local/letsencrypt.sh/.acme-challenges/$1;
}

# Generation 6
location ~ ^\/.well-known\/acme-challenge\/(.*)$ {
        allow all;
        satisfy any;
        alias /usr/local/dehydrated/.acme-challenges/$1;
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

# Overwrite whole virtual host

```nginx
location ~* "^/" {
        root /home/$username/www;
}
```

# Different Favicon per Hostname

```nginx
location = /favicon.ico {
   try_files /dev/null /favicons/$http_host.ico;
}
```
