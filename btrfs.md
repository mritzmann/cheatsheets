# Btrfs

## Create Snapshot

```shell
# create read-only snapshot
btrfs sub snap -r /path/to/source /path/to/target

# create snapshot
btrfs sub snap /path/to/source /path/to/target
```

## Diff between Snapshots

> This tool can show you what folders have the most changed data between snapshots

https://github.com/rkapl/btsdu

```shell
apt install -y cargo
cargo install btsdu
~/.cargo/bin/btsdu -p /snapshot/20201126-0357-day /snapshot/20201127-0357-day
```

## Quota

```shell
# enable
btrfs quota enable /

# show
btrfs qgroup show /

# disable
btrfs quota disable /
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

## Disabling COW (NODATACOW)

Disabling or enabling COW only works on 0 byte sized files.

- Turn off COW on file or folder: `chattr +C file`
- Turn on COW on file or folder: `chattr -C file`
- See if COW is on or off for file: `lsattr filename`
- See if COW is on or off for directory: `lsattr -d directory`

## Set Subvolume to Read-only

```shell
# set to read-only
btrfs property set -ts /path/to/subvolume ro true

# disable read-only
btrfs property set -ts /path/to/subvolume ro false
```

## Restore to Snapshot

```shell
# get subvolume id
btrfs sub list /

# set subvolume id as default
btrfs subvolume set-default <ID> /
```

## Show Compression Ratio

> compsize takes a list of files (given as arguments) on a btrfs filesystem and measures used compression types and effective compression ratio, producing a report

https://github.com/kilobyte/compsize

```shell
# make
git clone https://github.com/kilobyte/compsize.git
cd compsize
make

# debian: or install
apt-get -y install btrfs-compsize

compsize /path/to/file
```

## Btrfs Processes 

- `btrfs-cleaner`: A possible cause for a high disk I/O load are deleted or created snapshots and the recalculation of btrfs quota. You can disable btrfs quota with `btrfs quota disable <path>`. Source: [spinics.net](https://www.spinics.net/lists/linux-btrfs/msg74737.html)
- `btrfs-transacti`

Kernel threads (`kworker`):

Are shown in `htop` witch shift-k.

- `btrfs-endio-write`
- `btrfs-endio-meta`
- `btrfs-worker`

## nspawn

> `systemd-nspawn -x -D /` will create a snapshot of your `/`, chroot into it, and delete it on exit. Works for xfs and btrfs

https://www.reddit.com/r/linux/comments/ncw7xc/btrfs_use_cases/gy88mnc/
