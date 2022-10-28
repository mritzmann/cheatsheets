# Find

Search for files containing two strings, no matter at which location or line:

```shell
find . -type f -exec grep -q 8-0-stable {} \; -exec grep -l python {} \;
```
