# Postfix

## View Mail Queue

```shell
mailq
```

## View E-Mail in Mail Queue

```shell
postcat -vq 0E0401614D3
```

## Grep and delete

```shell
cd /var/spool/postfix/deferred

# grep for string and print path            only filename      delete
grep -r -i -l "srv08.example.com" ./ | cut -d/ -f3      | postsuper -d -
```

## Send Test E-Mail

```shell
echo "Test Mail" | mail -s subject test@example.com
```
