# Makefile

Command on multiple lines:

```makefile
build:
        cd ./generate/ ; \
        docker build --tag gdal2tiles:latest .
```
