# Postfix

## Grep and delete

```shell
cd /var/spool/postfix/deferred

# grep for string and print path            only filename      delete
grep -r -i -l "srv08.iresults.hosting" ./ | cut -d/ -f3      | postsuper -d -
```
