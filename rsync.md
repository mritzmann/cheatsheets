# Rsync

## One-Way Sync

```shell
rsync -avz --delete <user>@<server>:/home/user/ /home/user/
```

* `-a`: archive mode
* `-v`: increase verbosity
* `-z`: compress file data during the transfer
* `--delete`: delete extraneous files from dest dirs
* `--exclude=PATTERN`: exclude files matching PATTERN
* `--info=progress2`: statistics

## Mass Delete

If you want to delete a directory with several million files, `rm -rf folder` is extremely slow. `rsync` is faster.

```
mkdir empty
rsync -a --delete empty/ folder/
```
