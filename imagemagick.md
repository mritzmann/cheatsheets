# ImageMagick

Rotate image:

```shell
# counterclockwise:
mogrify -rotate -90 *.jpg

# clockwise:
mogrify -rotate 90 *.jpg
```

Resize image with keeping aspect ratio:

```shell
mogrify -geometry 1000x *.jpg
```
