# Docker

## Platform

Choose another CPU architecture:

```shell
docker run --platform linux/amd64 -it debian:latest
```

Dockerfile:

```Dockerfile
FROM --platform=linux/amd64 debian:latest
```
