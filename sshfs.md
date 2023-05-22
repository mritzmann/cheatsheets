# sshfs

## Install

Install macFUSE and SSHFS from https://osxfuse.github.io/.

## Mount

```shell
sshfs server01.example.com:/path/to/mount $HOME/mnt/
```

## Umount

Force:

```shell
diskutil unmountDisk force /path/to/mount
```
