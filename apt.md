# apt

Hint why a package is installed:

```
$ apt-cache rdepends --installed libproxy1v5
libproxy1v5
Reverse Depends:
  glib-networking
  glib-networking-services
```

Install from backports:

```shell
apt-get install <package>/buster-backports
```

List all files from package:

```shell
dpkg-query -L <package>
```
