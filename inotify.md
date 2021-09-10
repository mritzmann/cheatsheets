# inotify

Debian package name: `inotify-tools`

## Watch for new Files

```
inotifywait -m /path/to/folder -e create -e moved_to |
    while read dir action file; do
        echo "The file '$file' appeared in directory '$dir' via '$action'"
    done
```

Source: https://unix.stackexchange.com/a/24955
