# Docker

## Resource Usage

Display resource usage statistics:

```shell
docker stats --no-stream
```

## Platform

Choose another CPU architecture:

```shell
docker run --platform linux/amd64 -it debian:latest
```

Dockerfile:

```Dockerfile
FROM --platform=linux/amd64 debian:latest
```

## Entrypoint vs. CMD

```shell
docker run -it --entrypoint "/bin/sh -c" alpine:latest <CMD>
```

|             | Entrypoint     | CMD    |
| ----------- | :------------- | :----- |
| Default:    | `/bin/sh -c`   | none   |
| Dockerfile: | `ENTRYPOINT`   | `CMD`  |
| CLI:        | `--entrypoint` |        |

* The entrypoint is always executed
* CMD only if specified in the `Dockerfile` or given in the `docker run` command

## Buildkit

```shell
DOCKER_BUILDKIT=1 docker build --tag image:name .
```

> By integrating BuildKit, users should see an improvement on performance, storage management, feature functionality, and security.

https://docs.docker.com/develop/develop-images/build_enhancements/
