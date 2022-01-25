# APT (Package Manager for Debian)

Install a specific version:

```shell
apt-get install <package>=<version>
```

Hint why a package is installed:

```shell
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

How do I find out which repository a package comes from:

```shell
apt policy <package>
apt-cache policy <package>
```
