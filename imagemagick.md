# ImageMagick

Rotate image:

```shell
# clockwise:
mogrify -rotate 90 *.jpg

# counterclockwise:
mogrify -rotate -90 *.jpg
```

Resize image with keeping aspect ratio:

```shell
mogrify -geometry 1000x *.jpg
```
