# Find

Search for files containing two strings, no matter at which location or line:

```shell
find . -type f -exec grep -q STRING1 {} \; -exec grep -l STRING2 {} \;
```
