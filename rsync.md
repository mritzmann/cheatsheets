# Rsync

```shell
rsync -avz --delete <user>@<server>:/home/user/ /home/user/
```

* `-a`: archive mode
* `-v`: increase verbosity
* `-z`: compress file data during the transfer
* `--delete`: delete extraneous files from dest dirs
* `--exclude=PATTERN`: exclude files matching PATTERN
* `--info=progress2`: statistics
