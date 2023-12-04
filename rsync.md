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

## Jump Host

* `-e`: specify the remote shell to use

Copy from `srv01.example.com` to local over `jump01.example.com`:

```shell
rsync -avz -e "ssh -J user@jump01.example.com" user@srv01.example.com:/path/to/source/ /path/to/target/
```

## Change Owner

Changes owner of the data:

```shell
rsync -avz --delete --chown=user02:user02 /home/user01/www/ /home/user02/www/
```

## Mass Delete

If you want to delete a directory with several million files, `rm -rf folder` is extremely slow. `rsync` is faster.

```
mkdir empty
rsync -a --delete empty/ folder/
```
