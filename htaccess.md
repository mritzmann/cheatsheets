# Apache .htaccess

Redirect whole vhost:

```apache
# redirect
RewriteEngine On
RewriteRule (.*)$ https://example.com/$1 [R=301,L]
```
