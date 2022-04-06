# Btrfs

## Snapshots

Create read-only snapshot:

```shell
btrfs sub snap -r /path/to/source /path/to/target
```

Create writable snapshot:

```shell
btrfs sub snap /path/to/source /path/to/target
```

## Send and Receive

Push snapshot to another host:

```shell
btrfs send /path/to/snapshot | pv | ssh root@srv01.example.com "btrfs receive /path/to/snapshot"
```

Pull snapshot from another host:

```shell
ssh root@srv01.example.com "btrfs send /path/to/snapshot" | pv | btrfs receive /path/to/snapshot
```

## Quota

Btrfs quota may require a lot of performance (depending on the number of files and snapshots) and should therefore be deactivated.

Enable:

```shell
btrfs quota enable /
```

Show:

```shell
btrfs qgroup show /
```

Disable:

```
btrfs quota disable /
```

## Sync

If you delete a subvolume with `btrfs sub delete`, you should not reboot the system until the subvolume is really gone.
You can check this with the `btrfs sub sync` command.

```shell
$ btrfs sub sync /                                      
Subvolume id 276 is gone
```

## Disabling COW (NODATACOW)

Disabling or enabling COW only works on 0 byte sized files.

Turn COW on files and folder:

- Off: `chattr +C file`
- On: `chattr -C file`

See if COW is on or off:

- For files: `lsattr filename`
- For directorys: `lsattr -d directory`

## Set Subvolume to Read-only

Set to read-only:

```shell
btrfs property set -ts /path/to/subvolume ro true
```

Disable read-only:

```shell
btrfs property set -ts /path/to/subvolume ro false
```

## Btrfs Processes 

- `btrfs-cleaner`: A possible cause for a high disk I/O load are deleted or created snapshots and the recalculation of btrfs quota. Source: [spinics.net](https://www.spinics.net/lists/linux-btrfs/msg74737.html)
- `btrfs-transacti`

Kernel threads (`kworker`) are shown in `htop` witch <kbd>shift-k</kbd>:

- `btrfs-endio-write`
- `btrfs-endio-meta`
- `btrfs-worker`

## Tools

### Btdu - Sampling Disk Usage Profiler for Btrfs

> By nature of its algorithm, btdu works correctly with compression and other btrfs filesystem features

https://github.com/CyberShadow/btdu

### Btsdu - Btrfs Snapshot Disk Usage Analyzer

> This tool can show you what folders have the most changed data between snapshots

https://github.com/rkapl/btsdu

```shell
apt install -y cargo
cargo install btsdu
~/.cargo/bin/btsdu -p /snapshot/20201126-0357-day /snapshot/20201127-0357-day
```

### Systemd-nspawn - Spawn a command or OS in a light-weight container

> Nspawn will create a snapshot, chroot into it, and delete it on exit. Works for xfs and btrfs.

https://www.reddit.com/r/linux/comments/ncw7xc/btrfs_use_cases/gy88mnc/

```shell
systemd-nspawn -x -D /
```

### Compsize - Find compression type/ratio on a file

> compsize takes a list of files on a btrfs filesystem and measures used compression types and effective compression ratio, producing a report

https://github.com/kilobyte/compsize

Install:

```shell
apt-get -y install btrfs-compsize
```

Or make:

```shell
git clone https://github.com/kilobyte/compsize.git
cd compsize
make
```

Use:

```shell
compsize /path/to/file
```
