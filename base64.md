# Base64

* Base64 is a scheme that represent binary data in an ASCII format
* One Base64 digit represents 6 bits of data

## Encode

```shell
echo  'Hello world!' | base64
```

## Decode

```shell
echo 'SGVsbG8gd29ybGQhCg==' | base64 -d
echo 'SGVsbG8gd29ybGQhCg==' | base64 --decode
```
